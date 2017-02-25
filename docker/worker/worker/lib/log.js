var log = require('winston'),
slack = require('winston-slack-transport').Slack;

var token = process.env.SLACK_TOKEN,
level = process.env.SLACK_LEVEL,
username = process.env.SLACK_USERNAME,
channel = process.env.SLACK_CHANNEL;
icon = process.env.SLACK_ICON;

if (token && level && channel && username && icon) {
log.add(slack, {
    apiToken: "https://hooks.slack.com/services/ + token",
    channel: "channel",
    username: "username",
    level: "level",
    icon: "icon",
    handleExceptions: true
});
}
else {
  log.info('Missing setup information for Slack.');
}
