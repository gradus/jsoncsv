(function() {
  var log, parseJson;

  require('./jsoncsv');

  log = console.log;

  parseJson = function(json) {
    return log(json);
  };

  module.exports = function(json) {
    if (json == null) json = null;
    json = JSON.parse(json);
    if (json == null) {
      return log('JSON Required!\nex: jsoncsv convert \'{"some":"json"}\'');
    }
    if (json !== null) return log(json);
  };

}).call(this);
