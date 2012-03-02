(function() {
  var app, cmdConvert, flatiron, path;

  cmdConvert = require('./convert');

  flatiron = require('flatiron');

  path = require('path');

  require('pkginfo')(module);

  app = flatiron.app;

  app.version = exports.version;

  app.use(flatiron.plugins.cli, {
    source: path.join(__dirname, 'lib'),
    usage: ["", "jsoncsv v" + app.version, "Converts JSON to CSV", "", "jsoncsv convert '{\"some\": \"json\"}'"],
    version: true
  });

  app.cmd('version', function() {
    return console.log('jsoncsv v' + app.version);
  });

  app.cmd('convert', cmdConvert);

  app.start();

}).call(this);
