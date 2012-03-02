(function() {
  var log, parseJson;

  require('./jsoncsv');

  log = console.log;

  parseJson = function(json, cb) {
    log('Parsing JSON...');
    log(json);
    return cb();
  };

  module.exports = function(json, cb) {
    if (json == null) {
      return console.log('JSON Required!\nex: jsoncsv convert \'{"some":"json"}\'');
    } else {
      return console.log(json);
    }
    return parseJson(json, function() {
      return cb();
    });
  };

}).call(this);
