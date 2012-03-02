require './jsoncsv'

log = console.log

parseJson = (json) ->
  return log json


module.exports = (json=null) ->
  json = JSON.parse(json)
  return log 'JSON Required!\nex: jsoncsv convert \'{"some":"json"}\'' unless json?
  return log json if json != null
  #parseJson json, -> cb(null, 'done')

