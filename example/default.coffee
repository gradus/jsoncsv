fs = require 'fs'
jsoncsv = require '../lib/index'

data = fs.readFileSync('data.json').toString()
jsoncsv.parse data, (err, row) ->
  console.log row
