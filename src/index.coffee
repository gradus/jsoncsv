# jsoncsv
# json to csv converter

class JsonCsv extends require('events').EventEmitter
  # parse JSON data and return csv output
  # callback returns (err, row)

  parse: (data, columns = {}, cb) ->
    # columns should be array of json nodes
    return cb('error no data') unless data?
    json = JSON.parse(data)
    delete json['_events']
    console.log json
    csv = ''
    line = columns.join(',') + '\r\n'
    i = 0
    while i < json.length
      for index of json[i]
        if typeof(json[i][index]) == 'object'
          for column in columns
            line += json[i][index]["#{column}"] + "," if json[i][index]["#{column}"] != undefined
          line += '\r\n'
        else
          if json[i][index].match(/(invalidClaim|validatingClaim)/)
            line += json[i][index] + ','
          else 
            if json[i][index].match(/^Invalid\s{1}/)
              line += json[i][index] + '\r\n'
            else 
              if json[i][index].match(/\S{20}/)
                unless i == 0
                  line += "none\r\n"
            i = i + 1
    line.slice 0, line.Length - 1
    csv += line + "\r\n"

    return cb(null, csv)


module.exports = new JsonCsv()


