# https://ruby-doc.org/core-2.7.1/Exception.html


# Global Variables
# When an exception has been raised but not yet handled (in rescue, ensure, at_exit and END blocks), two global variables are set:

# $! contains the current exception.

# $@ contains its backtrace.


puts "CASE 1:".ljust(40, "-")
begin  
   # raise 'A test exception.'  
   1 / 0

rescue ZeroDivisionError => e     #  Or ZeroDivisionError
   puts e.message  
   puts e.backtrace.inspect  

rescue Exception => e
	p e

ensure 
	puts "This will always be executed"
end  


puts "CASE 2:".ljust(40, "-")
begin  
   puts "Good here"

rescue ZeroDivisionError => e     #  Or ZeroDivisionError
   puts e.message  
   puts e.backtrace.inspect  

rescue Exception => e
	p e

else 
	p "No exception"
ensure 
	puts "This will always be executed"
end  