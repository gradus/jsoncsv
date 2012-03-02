fs = require 'fs'
jsoncsv = require '../lib/jsoncsv'
COLUMNS = ['key1','key2','key3','action']

data = fs.readFileSync('data.json').toString()
jsoncsv.parse data, COLUMNS
