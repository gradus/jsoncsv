(function() {
  var JsonCsv,
    __hasProp = Object.prototype.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype; return child; };

  JsonCsv = (function(_super) {

    __extends(JsonCsv, _super);

    function JsonCsv() {
      JsonCsv.__super__.constructor.apply(this, arguments);
    }

    JsonCsv.prototype.parse = function(data, columns, cb) {
      var column, csv, field, i, index, j, json, line, _i, _j, _len, _len2;
      if (data == null) return cb('error no data');
      if (columns == null) return cb('error please provide columns as options');
      data = JSON.stringify(data);
      json = JSON.parse(data);
      for (_i = 0, _len = json.length; _i < _len; _i++) {
        j = json[_i];
        delete j['_events'];
        delete j['_id'];
        delete j['id'];
      }
      csv = '';
      line = columns.join(',') + '\r\n';
      i = 0;
      while (i < json.length) {
        for (index in json[i]) {
          if (json[i][index] !== void 0 && typeof json[i][index] === 'object') {
            for (_j = 0, _len2 = columns.length; _j < _len2; _j++) {
              column = columns[_j];
              field = json[i][index]["" + column];
              if (field !== void 0) line += field + ",";
              if (field === null || field === void 0) line += ",";
            }
          } else {
            if (json[i] !== void 0) {
              if (json[i][index] !== void 0) line += json[i][index] + ",";
            }
            i = i + 1;
          }
        }
        line += '\r\n';
      }
      line.slice(0, line.Length - 1);
      csv += line + "\r\n";
      return cb(null, csv);
    };

    return JsonCsv;

  })(require('events').EventEmitter);

  module.exports = new JsonCsv();

}).call(this);
