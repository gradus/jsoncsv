# jsoncsv
# json to csv converter
class JsonCsv extends require('events').EventEmitter
  # parse JSON data and return csv output
  # callback returns (err, row)

  parse: (data, columns, cb) ->
    # columns should be array of json nodes
    return cb('error no data') unless data?
    return cb('error please provide columns as options') unless columns?
    data = JSON.stringify(data)
    json =  JSON.parse(data)
    for j in json
      delete j['_events']
      delete j['_id']
      delete j['id']
    csv = ''
    line = columns.join(',') + '\r\n'
    i = 0
    while i < json.length
      for index of json[i]
        if json[i][index] != undefined and typeof(json[i][index]) == 'object'
          for column in columns
            field = json[i][index]["#{column}"]
            line += field + "," if field != undefined
            line += "," if field == null or field == undefined
        else
          if json[i] != undefined
            line += json[i][index] + "," if json[i][index] != undefined
          i = i + 1
      line += '\r\n'

    line.slice 0, line.Length - 1
    csv += line + "\r\n"
    return cb(null, csv)


module.exports = new JsonCsv()
