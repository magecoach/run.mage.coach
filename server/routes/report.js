'use strict';

var express = require('express');
var router = express.Router();

router.get('/', function(req, res) {
	res.render('report/index', {
		layout: 'main',
		bodyId: 'report',
		title: 'Magento Web Performance Report',
		description: 'We have put a lot of love into making it easy to create your own Magento Performance Report. Submit your URL now! That’s it :)'
	});
});

module.exports = router;
