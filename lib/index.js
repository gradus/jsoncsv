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
      delete json['_events'];
      csv = '';
      i = 0;
      while (i < json.length) {
        line = 'FROM DATE, THRU DATE, CARRIER ID, ACCOUNT ID, GROUP ID, FACILITY ID, MEMBER ID, MEMBER First Name, MEMBER Last Name, PRESC ID, PCP ID, PRESC NAME, PHARMACY, RX #, DATE DISP, REFILL, DRUG NAME, NDC, #DAYS SUP, Decimal QTY, SUBMITTED COST, APPROVED COST, OPAR, FEE, INC FEE, TAX, PAT PAY, MGMT FEE, AMOUNT PAID, batch_name, billing_period, disp_ndc, cost, patientId, awp, aac, medication_type, prescription_type, Status\r\n';
        for (index in json[i]) {
          if (typeof json[i][index] === 'object') {
            line += json[i][index]['FROM DATE'] + ",";
            line += json[i][index]['THRU DATE'] + ",";
            line += json[i][index]['CARRIER ID'] + ",";
            line += json[i][index]['ACCOUNT ID'] + ",";
            line += json[i][index]['GROUP ID'] + ",";
            line += json[i][index]['FACILITY ID'] + ",";
            line += json[i][index]['MEMBER ID'] + ",";
            line += json[i][index]['MEMBER First Name'] + ",";
            line += json[i][index]['MEMBER Last Name'] + ",";
            line += json[i][index]['PRESC ID'] + ",";
            line += json[i][index]['PCP ID'] + ",";
            line += json[i][index]['PRESC NAME'] + ",";
            line += json[i][index]['PHARMACY'] + ",";
            line += json[i][index]['RX #'] + ",";
            line += json[i][index]['DATE DISP'] + ",";
            line += json[i][index]['REFILL'] + ",";
            line += json[i][index]['DRUG NAME'] + ",";
            line += json[i][index]['NDC'] + ",";
            line += json[i][index]['#DAYS SUP'] + ",";
            line += json[i][index]['Decimal QTY'] + ",";
            line += json[i][index]['SUBMITTED COST'] + ",";
            line += json[i][index]['APPROVED COST'] + ",";
            line += json[i][index]['OPAR'] + ",";
            line += json[i][index]['FEE'] + ",";
            line += json[i][index]['INC FEE'] + ",";
            line += json[i][index]['TAX'] + ",";
            line += json[i][index]['PAT PAY'] + ",";
            line += json[i][index]['MGMT FEE'] + ",";
            line += json[i][index]['AMOUNT PAID'] + ",";
            line += json[i][index]['batch_name'] + ",";
            line += json[i][index]['billing_period'] + ",";
            line += json[i][index]['disp_ndc'] + ",";
            line += json[i][index]['cost'] + ",";
            line += json[i][index]['patientId'] + ",";
            line += json[i][index]['awp'] + ",";
            line += json[i][index]['aac'] + ",";
            line += json[i][index]['medication_type'] + ",";
            line += json[i][index]['prescription_type'] + ",";
          } else {
            line += json[i][index];
          }
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
