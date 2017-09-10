#!/usr/bin/env node

'use strict';

var path = require('path'),
  express = require('express'),
  compress = require('compression'),
  handlebars = require('express-handlebars'),
  bodyParser = require('body-parser'),
  responseTime = require('response-time'),
  expressMinify = require('express-beautify'),
  api = require('./routes/api'),
  index = require('./routes/index'),
  about = require('./routes/about'),
  report = require('./routes/report'),
  faq = require('./routes/faq'),
  log = require('winston'),
  cookieParser = require('cookie-parser'),
  sponsors = require('./routes/sponsors'),
  result = require('./routes/result'),
  premium = require('./routes/premium');

	var logLevel = process.env.LOG_LEVEL || 'info';
	var logFile = process.env.LOG_FILE || 'server.log';

	var serverPort = process.env.SERVER_PORT || 3000;

	log.add(log.transports.File, {
		filename: logFile,
		handleExceptions: true,
		level: logLevel,
		json: false,
        exitOnError: false
		});

var app = express();

var minify = expressMinify.minify({
  collapseWhitespace: true,
  minifyCSS: true,
  minifyJS: true,
  removeAttributeQuotes: true,
  removeComments: true
});

app.use(compress());
app.use(responseTime());
app.use(minify);
app.use(cookieParser());

app.engine('.hb', handlebars({
  layoutsDir: path.join(__dirname, 'views', 'layouts'),
  partialsDir: path.join(__dirname, 'views', 'partials'),
  defaultLayout: 'main',
  extname: '.hb'
}));
app.set('view engine', '.hb');
app.set('views', path.join(__dirname, 'views'));

app.enable('view cache');

app.disable('x-powered-by');

app.use(bodyParser.urlencoded({ // to support URL-encoded bodies
  extended: true
}));

app.use('/img', express.static(path.join(__dirname, 'public', 'img'), {
  maxAge: '366 days'
}));

app.use('/texts', express.static(path.join(__dirname, 'public', 'texts'), {
  maxAge: '10 minutes'
}));

app.use('/robots.txt', express.static(path.join(__dirname, 'public', 'robots.txt'), {maxAge: '366 days'}));
app.use('/sitemap.xml', express.static(path.join(__dirname, 'public', 'sitemap.xml'), {maxAge: '366 days'}));

app.use('/result', result);
app.use('/api', api);
app.use('/sponsors', sponsors);
app.use('/report', report);
app.use('/premium', premium);
app.use('/about', about);
app.use('/faq', faq);
app.use('/', index);

app.use(function(req, res) {
  res.status(400);
  res.render('404', {
    title: '404: File Not Found',
    layout: 'main',
    bodyId: 'about'
  });
});

var server = app.listen(serverPort, function() {

  var host = server.address().address;
  var port = server.address().port;

  log.info('Web app listening at http://%s:%s', host, port);
});

process.on('SIGTERM', function () {
  server.close(function () {
    process.exit(0);
  });
});
