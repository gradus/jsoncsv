require './jsoncsv'
log = console.log

parseJson = (json, cb) ->
  log 'Parsing JSON...'
  log json
  cb()

module.exports = (json, cb) ->
  unless json?
    return console.log('JSON Required!\nex: jsoncsv convert \'{"some":"json"}\'')
  else
    return console.log json
  parseJson json, -> cb()

