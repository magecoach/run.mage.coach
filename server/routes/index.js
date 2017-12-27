'use strict';

var express = require('express'),
  uuid = require('uuid'),
  md5 = require('md5'),
  moment = require('moment'),
  queue = require('../queue'),
  validateUrl = require('validator'),
  db = require('../db');

var router = express.Router();

router.get('/', function(req, res) {
    res.render('home', {
    bodyId: 'start',
    title: 'Analyze your Magento performance against the best rules.',
    description: 'How fast is your Magento site? How good does it follow web performance best practice rules? Find out by using Mage.coach.',
  });
});

router.post('/', function(req, res) {
  var queueName = req.body.location || 'nyc';
  var sessionId = uuid.v4();
  var ip = req.headers['x-forwarded-for'] || req.ip;

  var url = req.body.url;
  if (url != 'undefined' && url.indexOf('http') === -1) {
    url = 'http://' + url;
  }

  if (url === 'undefined' || !validateUrl.isURL(url.toLowerCase())) {
    res.render('error', {
      text: 'The URL isn\'t valid',
      title: 'Ooops you need to have a valid URL',
      description: '',
      url: url
    });
    return;
  }

  var creationDate = moment();

  var config = {
    url: url.toLowerCase(),
    browser: req.body.browser || 'firefox',
    display: req.body.display || 'desktop',
    connection: req.body.connection || 'cable',
    email: req.body.email || 'email',
    maxPagesToTest: req.body.max || '1',
    maxDepthToTest: req.body.depth || '1',
    numberOfRuns: req.body.runs || '3',
    gpsi: process.env.GPSI || 'zQZQH_PDXSgwsi8ASWH_zQZQHgAIzaSyAi0A',
    multiurl: req.body.multiurl,
    date: creationDate
  };


  // create the path to the result

  var hash = (md5(creationDate)).substring(0, 4);
  var myPath = hash + '-' + creationDate.year() + '/' + creationDate.month() + '/' + creationDate.date();

  queue.add(queueName, config, sessionId, myPath, function(err, id, queueNumber) {
    if (err) {
      res.redirect('/');
    } else {
      db.storeRun(config.url, sessionId, ip, creationDate, config.browser, config.display, config.email, config.multiurl, queueName, function() {
        res.cookie('ssioqueue', queueNumber);
        // res.cookie('name', 'tobi', { domain: '.example.com', path: '/admin', secure: true });
        res.redirect('/result/' + sessionId);
      });
    }
  });
});

module.exports = router;
