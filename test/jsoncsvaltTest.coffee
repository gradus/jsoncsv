assert = require 'assert'
should = require 'should'
jsoncsv = require '../lib/jsoncsv'

COLUMNS = ['key1','key2','key3','action','coder']
json = [ { "data": { "key1" : "val1", "key2" : "val2", "key3" : "val3" }, "action" : "testing" } ]
describe 'jsoncsv', ->
  describe '#parse alternate json', ->
    it 'is successful', (done) ->
      jsoncsv.parse json, COLUMNS, (err, row) ->
        console.log row
        row.should == "key1,key2,key3,action\r\nval1,val2,val3,testing"
      done()
    it 'let user know columns are required', ->
      jsoncsv.parse json, null, (err, row) ->
        err.should == 'error no data'
