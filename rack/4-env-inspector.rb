require 'rack'
require 'rack/server'

class EnvInspector
  def self.call(env)
    [ 200, { }, [ env.inspect ] ]
  end
end

Rack::Server.start :app => EnvInspector


# Now visit http://localhost:9292?message=foo

# You may have noticed that the env doesn’t do any fancy parsing. 
# The query string wasn’t a hash. It was the string. It is raw data. 
# Rack is simple to understand and use. You could only work with 
# hashes and triplets. However that’s tedious and doesn’t scale. 

# Complex applications need abstractions. Enter Rack::Request and Rack::Response.