require 'rack'
require 'rack/server'

class HelloWorldApp
  def self.call(env)
    [ 200, { }, [ "Hello World. You said: #{env['QUERY_STRING']}" ]]
  end
end

Rack::Server.start :app => HelloWorldApp

# Now visit http://localhost:9292?message=foo and you’ll see "message=foo" 
# on the page. If you’re more curious about env you can do this: