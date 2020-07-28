require 'webrick'

include WEBrick

server = HTTPServer.new(
  :Port => 3000,
  :DocumentRoot => Dir.pwd
)

trap('INT') { server.shutdown}
server.start