require 'rack'
require 'rack/server'


#RUN IT WITH URL: http://localhost:9292/?a=bcd

class ParamsParser
  def initialize(app)
    @app = app
  end

  def call(env)
    request = Rack::Request.new env
    env['params'] = request.params
    @app.call env
  end
end

class HelloWorldApp
  def self.call(env)
    parser = ParamsParser.new self
    env = parser.call env
    # env['params'] is now set to a hash for all the input paramters

    [ 200, { }, [ env['params'].inspect ] ]
  end
end

class EnsureJsonResponse
  def initialize(app)
    @app = app
  end

  # Set the 'Accept' header to 'application/json' no matter what.
  # Hopefully the next middleware respects the accept header :)
  def call(env)
    env['HTTP_ACCEPT'] = 'application/json'
    @app.call env
  end
end

class Timer
  def initialize(app)
    @app = app
  end

  def call(env)
    before = Time.now
    status, headers, body = @app.call env

    headers['X-Timing'] = (Time.now - before).to_i.to_s

    [ status, headers, body ]
  end
end

class HelloWorldApp
  def self.call(env)

    [ 200, { }, [ env['params'].inspect ] ]
  end
end


# app = Rack::Builder.new do
#   use Timer # put the timer at the top so it captures everything below it
#   use EnsureJsonResponse
#   use ParamsParser
#   run HelloWorldApp
# end

# RUN the $ rackup  #command from the command line