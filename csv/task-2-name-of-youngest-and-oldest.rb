# Task 2: ( The Names of ) the Youngest and the Oldest
# Persons
# This (sub)task does not require getting any argument to the program. 
# It works on all the rows. This can be broken down to three parts.
#  1. Get the third column.
#  2. Change it into yyyymmdd format (this will make it easy to
#     compare numerically).
#  3. Sort the yyyymmdd values to get the minimum and the
#     maximum. Store the corresponding names.

mindate = 30000000;
maxdate = 1
begin
  infile = File.open('contacts.csv','r')
  while line = infile.gets
    col = line.split(',')

    # split date for individual date parts
    dtpart = col[2].split("/")

    # reassemble date parts in yyyymmdd format for easy sorting
    date = "#{dtpart[2]}#{dtpart[1]}#{dtpart[0]}".to_i 
    puts date

    # check if its a new minimum
    if (mindate > date) 
      mindate = date
      oldest = "#{col[0]} #{col[1]}"
    end

    # check if it is a new maximum
    if (maxdate < date) 
      maxdate = date 
      youngest = "#{col[0]} #{col[1]}"
    end

    puts "#{col[0]} #{col[1]} #{col[2]}"
  end
  rescue => e
    puts "ERROR: => "
    puts e.message
  ensure
  infile.close unless infile.nil?
end

# print the results
puts "Youngest: #{youngest}"
puts "Oldest: #{oldest}"