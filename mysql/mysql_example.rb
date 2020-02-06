require 'mysql2'

client = Mysql2::Client.new(:host => "127.0.0.1", :username=>"root", :password=>"root123", :database=> "blogs")

posts = client.query("SELECT * FROM posts")

puts "#{posts.count} rows found."

posts.each do |row|
  p row
end






