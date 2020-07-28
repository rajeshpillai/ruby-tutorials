# Ruby has a date class

require 'date'

dt = Date.parse('29/5/1976')
puts dt.strftime('%Y%m%d')

# Parse format can be passed explicity as shown below
dt2 = Date.parse('29/5/1976', '%d/%m/%Y')
puts dt2
puts dt2.strftime('%Y/%m/%d')
