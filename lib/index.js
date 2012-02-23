(function() {
  var JsonCsv,
    __hasProp = Object.prototype.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype; return child; };

  JsonCsv = (function(_super) {

    __extends(JsonCsv, _super);

    function JsonCsv() {
      JsonCsv.__super__.constructor.apply(this, arguments);
    }

    JsonCsv.prototype.parse = function(data, cb) {
      var csv, i, index, json, line;
      if (data == null) return cb('error no data');
      json = JSON.parse(data);
      csv = '';
      i = 0;
      while (i < json.length) {
        line = "";
        for (index in json[i]) {
          line += json[i][index] + ",";
        }
        line.slice(0, line.Length - 1);
        csv += line + "\r\n";
        i++;
      }
      return csv;
    };

    return JsonCsv;

  })(require('events').EventEmitter);

  module.exports = new JsonCsv();

}).call(this);
