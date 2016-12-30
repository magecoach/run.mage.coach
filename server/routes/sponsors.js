/**
 * Sitespeed.io - How speedy is your site? (https://www.sitespeed.io)
 * Copyright (c) 2015, Peter Hedenskog, Tobias Lidskog
 * and other contributors
 * Released under the Apache 2.0 License
 */
'use strict';

var express = require('express');
var router = express.Router();

router.get('/', function(req, res) {
	res.render('sponsors/index', {
		layout: 'main',
		bodyId: 'flash',
		title: 'Sponsor mage.coach and make it even better!',
		description: 'Do you want to help us keeping run.mage.coach up and running?'
	});
});

module.exports = router;
