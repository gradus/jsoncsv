# Convert Command
cmdConvert = require './convert'

flatiron = require 'flatiron'
path = require 'path'
require('pkginfo')(module)

app = flatiron.app
#app.config.file({ file: path.join(__dirname, 'config', 'config.json') })
app.version = exports.version

app.use flatiron.plugins.cli,
  source: path.join(__dirname, 'lib')
  usage: [
      ""
      "jsoncsv v#{app.version}"
      "Converts JSON to CSV"
      ""
      "jsoncsv convert '{\"some\": \"json\"}'"
    ]
  version: true

app.cmd 'version', ->
  console.log 'jsoncsv v' + app.version

app.cmd 'convert', cmdConvert

app.start()

