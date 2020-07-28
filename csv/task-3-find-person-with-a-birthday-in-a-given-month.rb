# Task 3: Persons with a Birthday in a Given Month
# This one is quite simple. Broadly, the steps are as follows.
# 1. Check that the first argument (integer value) is between 1 and
#    12 (both ends included).
# 2. Add 0 to the front if the integer is less than 10.
# 3. Compare it with the middle part (as split by '/') of the third
#    column (as split by ','), and if a match is found, print the name.

if ARGV.length < 1
  puts "Please provide the month [1 to 12]"
  exit
end
month1 = ARGV[0].to_i #Dec will become 0
if month1 < 1 or month1 > 12
  puts "Wrong format or month number : valid 1 to 12"
  exit
end
if month1 < 10
  month = "0" + month1.to_s
else
  month = month1.to_s
end
begin
  infile = File.open('contacts.csv','r')
  found = false
  while line = infile.gets
    col = line.split(',')
    birthmonth = col[2].split('/')[1]
    if birthmonth.eql?(month)
    puts "#{col[0]} #{col[1]}"
    found = true
    end
  end
  rescue => e
    puts "ERROR: "
    puts e.message
  ensure
    infile.close unless infile.nil?
end
puts "No record found for given month" if not found