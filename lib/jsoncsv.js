(function() {
  var JsonCsv,
    __hasProp = Object.prototype.hasOwnProperty,
    __extends = function(child, parent) {
      for (var key in parent) {
        if (__hasProp.call(parent, key)) child[key] = parent[key];
      }

      function ctor() {
        this.constructor = child;
      }
      ctor.prototype = parent.prototype;
      child.prototype = new ctor;
      child.__super__ = parent.prototype;
      return child;
    };

  JsonCsv = (function(_super) {

    __extends(JsonCsv, _super);

    function JsonCsv() {
      return JsonCsv.__super__.constructor.apply(this, arguments);
    }

    JsonCsv.prototype.parse = function(data, columns, cb) {
      var column, csv, field, i, index, j, json, line, _i, _j, _len, _len2;
      if (data == null) return cb('error no data');
      if (columns == null) return cb('error please provide columns as options');
      data = JSON.parse(data);
      json = data[Object.keys(data)[0]];
      for (_i = 0, _len = json.length; _i < _len; _i++) {
        j = json[_i];
        delete j['_events'];
        delete j['_id'];
        delete j['id'];
      }
      csv = columns.join(',') + '\r\n';
      i = 0;
      while (i < json.length) {
        line = "";
        if (typeof json[i] != "undefined") {
          var jsonObj = json[i];
          for (var ci = 0; ci < columns.length; ci++) {
            column = columns[ci];
            if (jsonObj.hasOwnProperty(column)) {
              if (typeof jsonObj[column] != "undefined") {
                var fieldValue = jsonObj[column];
                if (typeof fieldValue === 'object') {
                  if (column == "time") {
                    firstKey = Object.keys(fieldValue)[0];
                    if (firstKey == "$$date") {
                      var timestamp = new Date(fieldValue[firstKey]);
                      var year = timestamp.getFullYear();
                      var month = timestamp.getMonth() + 1;
                      if (month < 10) {
                        month = ("0" + month).slice(-2);
                      }
                      var date = timestamp.getDate();
                      if (date < 10) {
                        date = ("0" + date).slice(-2);
                      }
                      var hour = timestamp.getHours();
                      if (hour < 10) {
                        hour = ("0" + hour).slice(-2);
                      }
                      var min = timestamp.getMinutes();
                      if (min < 10) {
                        min = ("0" + min).slice(-2);
                      };
                      var sec = timestamp.getSeconds();
                      if (sec < 10) {
                        sec = ("0" + sec).slice(-2);
                      };
                      var msec = timestamp.getMilliseconds();
                      if (msec < 10) {
                        msec = (msec + "00").slice(-3);
                      } else {
                        if (msec < 100) {
                          msec = (msec + "0").slice(-3);
                        }
                      }
                      fieldValue = year + '-' + month + '-' + date + 'T' + hour + ':' + min + ':' + sec + '.' + msec + 'Z';
                    }
                  }
                }
                line += fieldValue;
              }
            }
            line += ",";
          }
        }
        i++;
        line = line.slice(0, - 1);
        csv += line + "\r\n";
      }

      return cb(null, csv);
    };

    return JsonCsv;

  })(require('events').EventEmitter);

  module.exports = new JsonCsv();

}).call(this);