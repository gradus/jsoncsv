# jsoncsv
# simple json to csv converter

class JsonCsv extends require('events').EventEmitter
  # parse JSON data and return csv output
  # callback returns (err, row)

  parse: (data, cb) ->
    return cb('error no data') unless data?

    json = JSON.parse(data)
    csv = ''
    i = 0

    while i < json.length
      line = ""
      for index of json[i]
        line += json[i][index] + ","
      line.slice 0, line.Length - 1
      csv += line + "\r\n"
      i++

    return csv



module.exports = new JsonCsv()
