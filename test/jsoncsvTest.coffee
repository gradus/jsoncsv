assert = require 'assert'
should = require 'should'
jsoncsv = require '../lib/jsoncsv'

COLUMNS = [
  'FROM DATE','THRU DATE','CARRIER ID','ACCOUNT ID','GROUP ID',
  'FACILITY ID','MEMBER ID','MEMBER First Name','MEMBER Last Name',
  'PRESC ID','PCP ID','PRESC NAME','PHARMACY','RX #','DATE DISP',
  'REFILL','DRUG NAME','NDC','#DAYS SUP','Decimal QTY',
  'SUBMITTED COST','APPROVED COST','OPAR','FEE','INC FEE','TAX',
  'TAX','PAT PAY','MGMT FEE','AMOUNT PAID','AMOUNT PAID',
  'batch_name','billing_period','disp_ndc','cost','patientId',
  'awp','aac','medication_type','prescription_type, Status, Reason'
]
data = [
  {
    "object": {
      "FROM DATE": "01/24/12",
      "THRU DATE": "01/31/12",
      "CARRIER ID": "2838",
      "ACCOUNT ID": "2838000",
      "GROUP ID": "000",
      "FACILITY ID": "",
      "MEMBER ID": "16617725301",
      "MEMBER First Name": "JOHNNIE",
      "MEMBER Last Name": "TESTER",
      "PRESC ID": "1843533671",
      "PCP ID": "",
      "PRESC NAME": "PRESCRIBER",
      "PHARMACY": "1546424753",
      "RX #": "6438741",
      "DATE DISP": "01/11/12",
      "REFILL": "01",
      "DRUG NAME": "FUROSEMIDE   TAB 40MG",
      "NDC": "00378-0216-10",
      "#DAYS SUP": "30",
      "Decimal QTY": "60.000",
      "SUBMITTED COST": "9.57",
      "APPROVED COST": "3.49",
      "OPAR": ".00",
      "FEE": "1.50",
      "INC FEE": ".00",
      "TAX": ".00",
      "PAT PAY": ".00",
      "MGMT FEE": ".00",
      "AMOUNT PAID": "4.99",
      "batch_name": "test",
      "billing_period": "201202",
      "disp_ndc": "00378021610",
      "cost": 0.08316666666666667,
      "_events": {},
      "prescriberId": 126,
      "patientId": 345,
      "awp": 0.1595,
      "aac": 0,
      "medication_type": "generic",
      "prescription_type": "rx"
    },
    "verb": "validatingClaim",
    "_events": {}
  }
]

describe 'jsoncsv', ->
  describe '#parse', ->
    it 'is successful', (done) ->
      jsoncsv.parse data, COLUMNS, (err, row) ->
        console.log row
        row.should == """
          FROM DATE,THRU DATE,CARRIER ID,ACCOUNT ID,GROUP ID,FACILITY ID,MEMBER ID,MEMBER First Name,MEMBER Last Name,PRESC ID,PCP ID,PRESC NAME,PHARMACY,RX #,DATE DISP,REFILL,DRUG NAME,NDC,#DAYS SUP,Decimal QTY,SUBMITTED COST,APPROVED COST,OPAR,FEE,INC FEE,TAX,TAX,PAT PAY,MGMT FEE,AMOUNT PAID,AMOUNT PAID,batch_name,billing_period,disp_ndc,cost,patientId,awp,aac,medication_type,prescription_type, Status, Reason
01/24/12,01/31/12,2838,2838000,000,,16617725301,JOHNNIE,TESTER,1843533671,,PRESCRIBER,1546424753,6438741,01/11/12,01,FUROSEMIDE   TAB 40MG,00378-0216-10,30,60.000,9.57,3.49,.00,1.50,.00,.00,.00,.00,.00,4.99,4.99,test,201202,00378021610,0.08316666666666667,345,0.1595,0,generic,rx,validatingClaim,none
        """
      done()
    it 'let user know error occured via parsing', ->
      jsoncsv.parse null, COLUMNS, (err, row) ->
        err.should == 'error no data'

