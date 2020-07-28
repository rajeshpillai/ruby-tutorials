require 'rubygems'
require 'webrick'
require 'mysql2'

# The data when posted is saved in a local file with the name data.txt

class WebForm < WEBrick::HTTPServlet::AbstractServlet

  def do_GET(request, response)
    status, content_type, body = print_questions(request)

    response.status = status
    response['Content-Type'] = content_type
    response.body = body
  end

  def print_questions(request)
    client = Mysql2::Client.new(:host => "127.0.0.1", :username=>"root", :password=>"root123", :database=> "blogs")
    
    html = "<html><body><form method='POST' action='/save'>"
    html += "<h1>ALL POSTS</h1><hr/>"
    rows = client.query("SELECT * FROM posts")
    p rows
    rows.each do |row|
      html += "<div>#{row['title']}</div><br />\n"
      html += "#{row['body']}<hr/><br />\n"
    end
    html += "<BR/><h2>NEW POST</h2>"
    html += "<input type='textbox' name='title' /><br /><br />\n"
    html += "<input type='submit'></form></body></html>"
    return 200, "text/html", html
  end
end

class Submit < WEBrick::HTTPServlet::AbstractServlet

  def do_POST(request, response)
    status, content_type, body = save_answers(request)
    
    response.status = status
    response['Content-Type'] = content_type
    response.body = body
  end

  def save_answers(request)
    if (filename = "posts" )
      # f = File.open("save-#{filename}.#{Time.now.strftime('%H%M%S')}.txt", 'w')
      f = File.open("data/data.txt", 'a')
      
      request.query.collect { | key, value | 
        f.write("#{key}: #{value}\n")
      }
      f.close
    end
  
    return 200, "text/plain", "Saved! Thank you."
  end
end

if $0 == __FILE__ then
  server = WEBrick::HTTPServer.new(:Port => 8000)
  server.mount "/posts", WebForm
  server.mount "/save", Submit
  trap "INT" do server.shutdown end
  server.start
end
