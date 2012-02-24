# jsoncsv
# simple json to csv converter

class JsonCsv
  # parse JSON data and return csv output
  # callback returns (err, row)

  parse: (data, cb) ->
    return cb('error no data') unless data?

    json = JSON.parse(data)
    csv = ''
    line = 'FROM DATE, THRU DATE, CARRIER ID, ACCOUNT ID, GROUP ID, FACILITY ID, MEMBER ID, MEMBER First Name, MEMBER Last Name, PRESC ID, PCP ID, PRESC NAME, PHARMACY, RX #, DATE DISP, REFILL, DRUG NAME, NDC, #DAYS SUP, Decimal QTY, SUBMITTED COST, APPROVED COST, OPAR, FEE, INC FEE, TAX, PAT PAY, MGMT FEE, AMOUNT PAID, batch_name, billing_period, disp_ndc, cost, patientId, awp, aac, medication_type, prescription_type, Status\r\n'
    i = 0
    while i < json.length
      for index of json[i]
        if typeof(json[i][index]) == 'object'
          line += json[i][index]['FROM DATE'] + "," if json[i][index]['FROM DATE']
          line += json[i][index]['THRU DATE'] + "," if json[i][index]['THRU DATE']
          line += json[i][index]['CARRIER ID'] + "," if json[i][index]['CARRIER ID']
          line += json[i][index]['ACCOUNT ID'] + "," if json[i][index]['ACCOUNT ID']
          line += json[i][index]['GROUP ID'] + "," if json[i][index]['GROUP ID']
          line += json[i][index]['FACILITY ID'] + "," if json[i][index]['FACILITY ID']
          line += json[i][index]['MEMBER ID'] + "," if json[i][index]['MEMBER ID']
          line += json[i][index]['MEMBER First Name'] + "," if json[i][index]['MEMBER First Name']
          line += json[i][index]['MEMBER Last Name'] + "," if json[i][index]['MEMBER Last Name']
          line += json[i][index]['PRESC ID'] + "," if json[i][index]['PRESC ID']
          line += json[i][index]['PCP ID'] + "," if json[i][index]['PCP ID']
          line += json[i][index]['PRESC NAME'] + "," if json[i][index]['PRESC NAME']
          line += json[i][index]['PHARMACY'] + "," if json[i][index]['PHARMACY']
          line += json[i][index]['RX #'] + "," if json[i][index]['RX #']
          line += json[i][index]['DATE DISP'] + "," if json[i][index]['DATE DISP']
          line += json[i][index]['REFILL'] + "," if json[i][index]['REFILL']
          line += json[i][index]['DRUG NAME'] + "," if json[i][index]['DRUG NAME']
          line += json[i][index]['NDC'] + "," if json[i][index]['NDC']
          line += json[i][index]['#DAYS SUP'] + "," if json[i][index]['#DAYS SUP']
          line += json[i][index]['Decimal QTY'] + "," if json[i][index]['Decimal QTY']
          line += json[i][index]['SUBMITTED COST'] + "," if json[i][index]['SUBMITTED COST']
          line += json[i][index]['APPROVED COST'] + "," if json[i][index]['APPROVED COST']
          line += json[i][index]['OPAR'] + "," if json[i][index]['OPAR']
          line += json[i][index]['FEE'] + "," if json[i][index]['FEE']
          line += json[i][index]['INC FEE'] + "," if json[i][index]['INC FEE']
          line += json[i][index]['TAX'] + "," if json[i][index]['TAX']
          line += json[i][index]['PAT PAY'] + "," if json[i][index]['PAT PAY']
          line += json[i][index]['MGMT FEE'] + "," if json[i][index]['MGMT FEE']
          line += json[i][index]['AMOUNT PAID'] + "," if json[i][index]['AMOUNT PAID']
          line += json[i][index]['batch_name'] + "," if json[i][index]['batch_name']
          line += json[i][index]['billing_period'] + "," if json[i][index]['billing_period']
          line += json[i][index]['disp_ndc'] + "," if json[i][index]['disp_ndc']
          line += json[i][index]['cost'] + "," if json[i][index]['cost']
          line += json[i][index]['patientId'] + "," if json[i][index]['patientId']
          line += json[i][index]['awp'] + "," if json[i][index]['awp']
          line += json[i][index]['aac'] + "," if json[i][index]['aac']
          line += json[i][index]['medication_type'] + "," if json[i][index]['medication_type']
          line += json[i][index]['prescription_type'] + "," if json[i][index]['prescription_type']
        else
          line += json[i][index]
      line.slice 0, line.Length - 1
      csv += line + "\r\n"
      i++
    return cb(null, csv)

module.exports = new JsonCsv()


