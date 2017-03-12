'use strict';
//thin wrapper around slack-node

var Slack = require('slack-node');
var slack = new Slack();
var enabled = true;

if (!process.env.SLACK_TOKEN ||
    !process.env.SLACK_USERNAME ||
    !process.env.SLACK_CHANNEL ||
    !process.env.SLACK_ICON) {
    console.log("Slack config incomplete");
    enabled = false;
}

slack.setWebhook("https://hooks.slack.com/services/" + process.env.SLACK_TOKEN);

function message(text) {
console.log("slack trigger: " + text);
    if(enabled) {
        slack.webhook({
            channel: process.env.SLACK_CHANNEL,
            username: process.env.SLACK_USERNAME,
            icon_emoji: process.env.SLACK_ICON,
            text: text
        }, function(err, response) {
            if(err)
                console.log(err);
            //Silently ignore response
        });
    }
}

module.exports = {
    debug: function(text) {
        message("DEBUG: " + text);
    },
    error: function(text) {
        message("ERROR: " + text);
    },
    info: function(text) {
        message("INFO:  " + text);
    },
    log: function(text) {
        message("LOG:   " + text);
    }
};
