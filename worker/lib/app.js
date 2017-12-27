#!/usr/bin/env node

'use strict';

var RSMQWorker = require('rsmq-worker'),
  path = require('path'),
  generateHtml = require('./generateHtml'),
  fs = require('fs-extra'),
  s3 = require('./s3'),
  async = require('async'),
  targz = require('tar.gz'),
  util = require('./util'),
  log = require('winston'),
  child_process = require('child_process'),
  nodemailer = require('nodemailer'),
  slack = require('./slack');


var logLevel = process.env.LOG_LEVEL || 'info';
var logFile = process.env.LOG_FILE ||  'worker.log';

var args = process.argv.slice(2);
var analyzeInProgress = false;

log.add(log.transports.File, {
  filename: logFile,
  handleExceptions: true,
  level: logLevel,
  json: false
});

if (args.length !== 3) {
  log.info('Usage: node worker.js <FETCH_QUEUE_NAME> <DATA_DIR> <HOSTNAME>');
  process.exit(1);
}

var fetchQueue = args[0];
var dataDir = args[1];
var hostName = args[2];

var redisHost = process.env.REDIS_HOST;
var resultQueue = process.env.REDIS_RESULT_QUEUE;
var redisPassword = process.env.REDIS_PASSWORD;

var mailUser = process.env.MAIL_USER;
var mailPassword = process.env.MAIL_PASSWORD;
var canMail = true;

if (!redisHost || !resultQueue || !redisPassword) {
  log.info('Missing env info, make sure REDIS is configured ' + JSON.stringify(process.env));
  process.exit(1);
}

if (!mailUser || !mailPassword) {
  log.info("Please set up mailing correctly. Mail disabled");
  canMail = false;
}

var options = {
  host: redisHost,
  invisibletime: 120,
  timeout: 0,
  maxReceiveCount: 1,
  options: {
    'auth_pass': redisPassword
  }
};

var fetchWorker = new RSMQWorker(fetchQueue, options);
var resultWorker = new RSMQWorker(resultQueue, options);

fetchWorker.on('message', function(msg, next) {
  // got an message, lets parse it
  var mess = JSON.parse(msg);
  analyzeInProgress = true;
  startJob(mess, function() {
    next();
    analyzeInProgress = false;
  });
});

fetchWorker.on('error', function(err, msg) {
  log.error('Error fetching message ' + msg.id, err);
});

process.on('SIGTERM', function() {

  log.info('Got shutting signal from SIGTERM');
  fetchWorker.stop();
  log.info('Stopped the queue');

  async.whilst(
    function() {
      return analyzeInProgress;
    },
    function(callback) {
      log.info('Waiting on analyze to finish, wait one more second:'+ analyzeInProgress);
      setTimeout(callback, 1000);
    },
    function(err) {
      log.info('Exiting from SIGTERM, no jobs running');
      process.exit(0);
    }
  );
});

log.info('Starting worker listening on queue ' + fetchQueue + ' send result to queue ' + resultQueue);
fetchWorker.start();

function startJob(message, cb) {

  if (message.u === undefined) {
    log.error('Missing url for  ' + message);
    cb();
    return;
  }

  log.info('Starting testing:' + message.u);

  var outputPath = message.p + '/' + message.id;

  var config = {
    url: message.u,
    browser: message.b,
    display: message.device,
    multiurl: message.multiurl,
    connection: message.c,
    maxPagesToTest: message.m || 1,
    numberOfRuns: message.n || 1,
    maxDepthToTest: message.d || 0,
    gpsi: message.g || 0,
    outputPath: outputPath,
    dataDir: dataDir,
    id: message.id,
    hostname: hostName
  };

  var metrics = {};

//  console.log(config);

  log.debug('Starting job with url: ' + config.url + ' ' + message.id);
  slack.info('Testing ' + config.url);

  async.series([
      function(callback) {
        resultWorker.send(JSON.stringify({
          id: message.id,
          status: 'running',
          hostname: hostName
        }), callback);
      },
      function(callback) {
          var display = '';
          if (config.display == 'mobile') {
              display = ' --mobile';
          }

          var workerCommand = '/start.sh -m ' + config.maxPagesToTest + ' -d ' + config.maxDepthToTest + ' -n ' + config.numberOfRuns + ' --gpsi.key ' + config.gpsi + ' --html.showAllWaterfallSummary --video --speedIndex -b ' + config.browser + ' --outputFolder ' + config.dataDir+'sitespeed-result/'+config.outputPath + ' -c ' + config.connection + display + ' --seleniumServer http://127.0.0.1:4444/wd/hub ' + config.url; //+ ' --plugins.load /magecoach ';

//	  console.log(workerCommand);

        resultWorker.send(JSON.stringify({
          id: config.id,
          status: 'Running',
          hostname: config.hostname
        }));


	  child_process.exec(workerCommand, callback);
      },
      function(callback) {
          try {
              var json_a;
                json_a = require(path.join(dataDir, 'sitespeed-result', outputPath, '/data/coach.summary.json'));
                metrics.ruleScore = json_a['score'].median;
              var json_b
                json_b = require(path.join(dataDir, 'sitespeed-result', outputPath, 'data/browsertime.summary.json'));
                metrics.rumSpeedIndex = json_b['rumSpeedIndex'].median;
          } catch (err) {
              callback(err);
          }

          fs.rename(path.join(dataDir, 'sitespeed-result', outputPath, 'index.html'), path.join(dataDir,
              'sitespeed-result', outputPath, 'index2.html'), callback);
      },
      function(callback) {
        var data = {
          id: message.id,
          url: config.url,
          browser: util.capitalize(config.browser),
          display: util.capitalize(config.display),
          location: util.getLocation(fetchQueue),
          connection: config.connection,
          link: 'index2.html',
          myUrl: 'https://report.mage.coach/' + outputPath + '/',
          stars: util.getStars(message.c, metrics.ruleScore, metrics.rumSpeedIndex),
          date: message.date,
          bodyId: util.getBodyId(message.c, metrics.ruleScore, metrics.rumSpeedIndex),
          boxTitle: util.getBoxTitle(message.c, metrics.ruleScore, metrics.rumSpeedIndex),
          boxDesciption: util.getBoxDescription(message.c, metrics.ruleScore, metrics.rumSpeedIndex)
        };

        // push the metrics
        Object.keys(metrics).forEach(function(key) {
          data[key] = metrics[key];
        });

        var generated = generateHtml.generate(data, 'index');
        var resultFile = path.join(path.join(dataDir, 'sitespeed-result', outputPath), 'index.html');
        fs.outputFile(resultFile, generated, function(err) {
            if (err) {
                log.log('error', 'Couldn\'t write the file ' + resultFile + ' err:' + err);
            } else {
                log.log('info', 'Wrote file ' + resultFile);
            }
            callback(err);
        });

        if(canMail) {
            //send mail
            let transporter = nodemailer.createTransport({
                service: 'gmail',
                auth: {
                    user: mailUser,
                    pass: mailPassword
                }
            });

            let mailOptions = {
                from: '"Mage Coach" <hello@mage.coach>',
                to: message.e,
                subject: 'Test results for '+message.u,
                text: generateHtml.generate(data, 'mail_plain'),
                html: generateHtml.generate(data, 'mail_html')
            };

            transporter.sendMail(mailOptions, (error, info) => {
                if (error) {
                    console.log(error);
                }
                console.log('Message %s sent: %s', info.messageId, info.response);
            });
        }
      },

      function(callback) {
        var files = ['data/aggregateassets.summary.json', 'data/browsertime.summary.json','data/coach.summary.json','data/domains.summary.json','data/largestassets.summary.json', 'data/pagexray.summary.json', 'data/slowestassets.summary.json', 'logs/sitespeed.io.log'];

        async.each(files, function(file, thecb) {
          fs.remove(path.join(dataDir, 'sitespeed-result', outputPath, file), thecb);

        }, function(err) {
          if (err) {
            log.error('Error removing files ', err);
          }
          callback(err);

        });
      },
      function(callback) {
        var compress = new targz().compress(path.join(dataDir, 'sitespeed-result', outputPath), path.join(dataDir,
          'sitespeed-result', outputPath, message.id + '.tar.gz'), function(err) {

          if (err) {
            log.error('Error compressing files ', err);
          } else {
            log.debug('Compressing files finished');
          }

          callback(err);
        });
      },
      function(callback) {
        resultWorker.send(JSON.stringify({
          status: 'uploading',
          id: message.id
        }), callback);
      },
      function(callback) {
        s3.uploadDir(path.join(dataDir, 'sitespeed-result', outputPath), outputPath, callback);
      }
    ],
    // optional callback
    function(err, results) {
      if (err) {
        log.error('Sending failed message on queue for ' + message.u, err);
        resultWorker.send(JSON.stringify({
          status: 'failed',
          id: message.id,
          hostname: hostName
        }), cb);
      } else {

        var m = {
          status: 'done',
          id: message.id,
          hostname: hostName
        };

        log.info('Finished testing [ok]:' + message.u);

        // push all the metrics
        Object.keys(metrics).forEach(function(key) {
          m[key] = metrics[key];
        });

        resultWorker.send(JSON.stringify(m), cb);
      }
    });
}
