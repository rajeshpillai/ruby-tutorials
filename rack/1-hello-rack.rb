# You'll notice similiaries between Ruby web applications built using Rails, Sinatra, Roda, or one of the numerous other options. You'll find similiarties in them all from they integreate with web servers and third party libaries. Rack makes this possible.

# Rack is the HTTP interface for Ruby. Rack defines a standard interface for interacting with HTTP and connecting web servers. Rack makes it easy to write HTTP facing applications in Ruby. Rack applications are shockingly simple. There is the code that accepts a request and code serves the response. Rack defines the interface between the two.

# This walkthrough covers Rack from the beginning up to applications, middleware, middleware stacks, testing, integrations, and finally webservers. You'll have a much better understanding of how the Ruby web stack works by the end of this walkthrough.


# Rack applications are objects that respond to call. They must return a "triplet". 
# A triplet contains the status code, headers, and body. Here’s an example class 
# that shows "hello world."

# This class is not a Rack application yet
class HelloWorld
	def response
		# triplet -> HTTP Response, Hash of headers and Enumerable body
		[200, {}, ["Hello World"]]  
	end

end

class HelloWorldApp
  def self.call(env)
    HellowWorld.new.response
  end
end
