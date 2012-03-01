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
      var column, csv, i, index, json, line, _i, _len;
      if (columns == null) columns = {};
      if (data == null) return cb('error no data');
      json = JSON.parse(data);
      delete json['_events'];
      console.log(json);
      csv = '';
      line = columns.join(',') + '\r\n';
      i = 0;
      while (i < json.length) {
        for (index in json[i]) {
          if (typeof json[i][index] === 'object') {
            for (_i = 0, _len = columns.length; _i < _len; _i++) {
              column = columns[_i];
              if (json[i][index]["" + column] !== void 0) {
                line += json[i][index]["" + column] + ",";
              }
            }
            line += '\r\n';
          } else {
            if (json[i][index].match(/(invalidClaim|validatingClaim)/)) {
              line += json[i][index] + ',';
            } else {
              if (json[i][index].match(/^Invalid\s{1}/)) {
                line += json[i][index] + '\r\n';
              } else {
                if (json[i][index].match(/\S{20}/)) {
                  if (i !== 0) line += "none\r\n";
                }
              }
              i = i + 1;
            }
          }
        }
      }
      line.slice(0, line.Length - 1);
      csv += line + "\r\n";
      return cb(null, csv);
    };

    return JsonCsv;

  })(require('events').EventEmitter);

  module.exports = new JsonCsv();

}).call(this);
