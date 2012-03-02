# Commands
cmdConvert = require './convert'

flatiron = require 'flatiron'
require('pkginfo')(module)
app = flatiron.app

app.version = exports.version

app.use flatiron.plugins.cli,
  dir: __dirname
  usage: [
    "jsoncsv v#{app.version}"
    "Converts JSON to CSV"
    ""
    "jsoncsv convert [your JSON]"
  ]
  version: true

app.cmd 'version', ->
  console.log 'jsoncsv v' + app.version

app.cmd 'convert', cmdConvert

app.start()
