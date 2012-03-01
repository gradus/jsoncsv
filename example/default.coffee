fs = require 'fs'
jsoncsv = require '../lib/index'
FIELDS = [
  'FROM DATE','THRU DATE','CARRIER ID','ACCOUNT ID','GROUP ID',
  'FACILITY ID','MEMBER ID','MEMBER First Name','MEMBER Last Name',
  'PRESC ID','PCP ID','PRESC NAME','PHARMACY','RX #','DATE DISP',
  'REFILL','DRUG NAME','NDC','#DAYS SUP','Decimal QTY',
  'SUBMITTED COST','APPROVED COST','OPAR','FEE','INC FEE','TAX',
  'TAX','PAT PAY','MGMT FEE','AMOUNT PAID','AMOUNT PAID',
  'batch_name','billing_period','disp_ndc','cost','patientId',
  'awp','aac','medication_type','prescription_type'
]

data = fs.readFileSync('data.json').toString()
jsoncsv.parse data, FIELDS, (err, row) -> console.log row
