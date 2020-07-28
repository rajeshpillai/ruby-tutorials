require 'webrick'

include WEBrick

server = HTTPServer.new(
  :Port => 3000,
  :DocumentRoot => Dir.pwd
)
# mount should happen before server start
server.mount_proc '/'  do |req, res|
  res.body = "Hello Ruby!"
end

server.mount_proc '/hi'  do |req, res|
  res.body = "Hi Ruby!"
end


trap('INT') { server.shutdown}
server.start