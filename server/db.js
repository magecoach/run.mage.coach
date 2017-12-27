'use strict';

var mysql = require('mysql'),
  log = require('winston');

var host = process.env.DATABASE_HOST;
var password = process.env.DATABASE_PASSWORD;
var user = process.env.DATABASE_USER;
var db = process.env.DATABASE_DB;

if (!host || !password || !user || !db) {
  console.log('Missing env info' + host + password + user + db);
  console.log(JSON.stringify(process.env));
  process.exit(1);
}

var pool = mysql.createPool({
  connectionLimit: 20,
  host: host,
  user: user,
  password: password,
  database: db
});

var NodeCache = require('node-cache');
var cache = new NodeCache({
  stdTTL: 4,
  checkperiod: 600
});

module.exports = {
  storeRun: function(url, id, ip, creationDate, browser, display, email, multiurl, location, cb) {

    pool.getConnection(function(err, connection) {

      if (err) {
        log.error('Couldn\'t get a connection from the pool', err);
        cb(err);
      } else {

        var post = {
          id: null,
          url: url,
          testId: id,
          location: location,
          browser: browser,
          display: display,
          email: email,
          multiurl: multiurl,
          created: creationDate.format('gggg-MM-DD HH:mm:ss'),
          testerIp: ip,
          status: 'waiting'
        };

        var query = connection.query('INSERT INTO runs SET ?', post, function(e, result) {
          if (e) {
            log.error('Couldn\'t insert the data into the database', query.sql, post, e);
          }
          connection.release();
          cb(err);
        });
      }
    });

  },
  getStatus: function(id, cb) {

    cache.get(id, function(err, value) {

      if (value != undefined) {
        cb(null, value.status, value.created, value.url);
      } else {
        pool.getConnection(function(err, connection) {
          if (err) {
            return cb(err);
          }

          var post = {
            testId: id
          };
          var query = connection.query('SELECT status, created, url FROM runs WHERE ?', post, function(
            error, results, fields) {
            if (error) {
              log.error('Couldn\'t get status from the the database', query.sql, post, error);
              cb(error);
            } else {
              if (results && results[0]) {

                cache.set(id, results[0], function(err, success) {
                  cb(null, results[0].status, results[0].created, results[0].url);
                });
              } else {
                // ooops we should return a error here
                cb(new Error('No data'));
              }
            }
            connection.release();
          });

        });
      }
    });
  }
};
