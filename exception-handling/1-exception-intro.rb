begin  
   # raise 'A test exception.'  
   1 / 0

rescue Exception => e  
   puts e.message  
   puts e.backtrace.inspect  

ensure 
	puts "This will always be executed"
end  