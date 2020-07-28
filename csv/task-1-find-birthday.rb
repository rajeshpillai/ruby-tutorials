# Task: Find birthday given firstname and last name
# Steps
#   - Get the argumetns: first and last names
#   - Check the argument count.
#   - Find and print out the person's date of birth
#   - Display a nice message when the name is not found
#   - Print out a nice error message when the file is not found (as the HR might
#     run the file from another directlry)

if ARGV.length != 2
  puts "Please provide first_name and last_name"
  exit
end

first_name = ARGV[0]
last_name = ARGV[1]

begin
  infile = File.open("contacts.csv")
  found = false
  while line = infile.gets
    col = line.split(',')
    # if first and second columns match with the names
    if col[0] == first_name && col[1] == last_name 
      puts "Date of Birth for #{first_name} #{last_name} is #{col[2]}"

      # mark as found and break
      found = true
      break
    end
  end
  # At this point found false means no line has matched the names
  if not found
    puts "Sorry birthday for #{first_name} #{last_name} not found - check spelling"
  end


rescue => exception
  puts "Could not find the file " + exception.message
ensure 
  infile.close unless infile.nil?
end