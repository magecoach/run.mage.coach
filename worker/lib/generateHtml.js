'use strict';

var moment = require('moment'),
minify = require('html-minifier').minify,
path = require('path'),
fs = require('fs-extra'),
log = require('winston'),
hb = require('handlebars');

var compiledTemplates = compileTemplates(path.join(__dirname, '../templates/'));

module.exports = {
generate: function (data, template) {
	var result = compiledTemplates[template](data);
	var result2 = minify(result, { removeComments: true, collapseWhitespace: true });
    return result2;
  }
};

function compileTemplates(folderPath) {
  // TODO would be cool to do this async
  var templates = {};
  fs.readdirSync(folderPath).forEach(function(file) {
    if (!fs.lstatSync(path.join(folderPath + file)).isDirectory()) {
      templates[path.basename(file, '.hb')] = hb.compile(fs.readFileSync(path.join(folderPath + file), 'utf8'));
    }
  });
  return templates;
}
