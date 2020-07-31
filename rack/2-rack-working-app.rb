require 'rack'
require 'rack/server'

class HelloWorld
  def response
    [ 200, { }, [ 'Hello World' ] ]
  end
end

class HelloWorldApp
  def self.call(env)
    HelloWorld.new.response
  end
end

Rack::Server.start :app => HelloWorldApp


# $ ruby 2-rack-working-app.rb
# Puma starting in single mode...
# * Version 4.3.5 (ruby 2.7.0-p0), codename: Mysterious Traveller
# * Min threads: 0, max threads: 16
# * Environment: development
# * Listening on tcp://0.0.0.0:9292
# Use Ctrl-C to stop

