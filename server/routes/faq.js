'use strict';

var express = require('express');
var router = express.Router();

router.get('/', function(req, res) {
	res.render('faq/index', {
		layout: 'main',
		bodyId: 'faq',
		title: 'FAQ run.mage.coach',
		description: 'Everything you need to know about testing using mage.coach.'
	});
});

module.exports = router;

