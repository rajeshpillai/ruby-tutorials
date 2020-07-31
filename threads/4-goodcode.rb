require 'open-uri'

urls = [
  'https://www.google.com/',
  'https://www.youtube.com/',
  'http://www.rubyflow.com',
  'https://rubyonrails.org/'
]
# threads array
threads = []

urls.each do |url|
  threads << Thread.new(url) do |i|
    resp = URI.open(i)
    puts "#{i} has content length #{resp.read.size} symbols"
  end
end

# run all threads
threads.each { |thr| thr.join }