# https://medium.com/@kopilov.vlad/working-with-thread-in-ruby-948cd7e5f1a8


# Threads make your Ruby programs do multiple things at the same time.

# Things like:

# Reading multiple files
# Handling multiple web request
# Making multiple API connections

# ---------
# So, what are threads?

	# Threads are workers, or units of execution.

	# Every process has at least one thread & you can create more on demand.

	# I know you want to see a code example.

	# But first, we need to talk about the difference between CPU bound & I/O bound applications.

# I/O Bound Applications
	# An i/o bound app is one that needs to wait for an external resource:

	# an API request
	# database (query results)
	# a disk read
	# A thread can decide to stop while it waits for a resource to be available. 
	#  This means that another thread can run and do its thing and not waste time waiting.

# One example of an i/o bound app is a web crawler.

# For every request, the crawler has to wait for the server to respond, and it can’t do 
# anything while waiting.

# But if you are using threads…

# You could make 4 requests at a time & handle the responses as they come back, 
#    which will let you fetch pages faster.


# For debugging purposes, you may want your program to stop 
# when something bad happens. To do that 
# you can set the following flag on Thread to true:

# Thread.abort_on_exception = true

t = Thread.new { puts "hello from thread.."}
puts "I am here"

# To get output from the thread call join method
t.join   