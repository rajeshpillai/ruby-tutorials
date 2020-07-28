#DOCS:
# https://docs.ruby-lang.org/en/2.4.0/WEBrick.html
# https://github.com/ruby/webrick/blob/master/test/webrick/test_httpserver.rb
# https://www.igvita.com/2007/02/13/building-dynamic-webrick-servers-in-ruby/

require 'webrick'

include WEBrick

server = HTTPServer.new(
  :Port => 3000,
  :DocumentRoot => Dir.pwd
)

class Simple < WEBrick::HTTPServlet::AbstractServlet
  def do_GET request, response
    status, content_type, body =  request.body

    response.status = 200
    response['Content-Type'] = 'text/html'
    response.body = '<h2>Hello, World!</h2>'
  end
end

server.mount '/simple', Simple

server.start