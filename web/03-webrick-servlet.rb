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