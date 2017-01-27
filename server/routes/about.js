'use strict';

var express = require('express');
var router = express.Router();

router.get('/', function(req, res) {
	res.render('about/index', {
		layout: 'main',
		bodyId: 'extra',
		title: 'Learn more about mage.coach',
		description: 'Mage.coach is an Open Source tool that helps you analyze your website speed and performance based on performance best practices and timing metrics.'
	});
});

module.exports = router;

