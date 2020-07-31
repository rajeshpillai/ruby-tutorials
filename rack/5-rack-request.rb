require 'rack'
require 'rack/server'

class HelloWorldApp
  def self.call(env)
    response = Rack::Response.new
    response.write 'Hello World'      # write some content to the body
    response.body = [ 'Hello World' ] # or set it directly
    response['X-Custom-Header'] = 'foo'
    response.set_cookie 'bar', 'baz'
    response.status = 202

    response.finish # return the generated triplet
  end
end

Rack::Server.start :app => HelloWorldApp


# These are basic abstractions. They don’t require much explanation. 
# You can learn more about them by reading the documentation.

# Now we build more complex applications now on these abstracations. 
# It’s hard to make an application when all the logic is in one class. 
# Applications are composed of different classes with different 
# responsiblities. These discrete chunks are called "middleware".