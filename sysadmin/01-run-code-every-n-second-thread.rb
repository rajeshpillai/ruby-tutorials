#!/home/rajesh/.rbenv/shims/ruby

# In most cases, you don’t want every_n_seconds to take over the main loop of your
# program. Here’s a version of every_n_seconds that spawns a separate thread to run
# your task. If your code block stops the loop with the break keyword, the thread stops
# running:

Thread.abort_on_exception=true

def every_n_seconds(n)
  thread = Thread.new do
    while true
      before = Time.now
      puts "yielding..."
      yield
      interval = n-(Time.now-before)
      sleep(interval) if interval > 0
    end
  end
  return thread
end


# In this snippet, we use every_n_seconds to spy on a file, waiting for people to
# modify it:
def monitor_changes(file, resolution=1)
  puts "Monitoring #{file}..."
  last_change = Time.now
  every_n_seconds(resolution) do
    check = File.stat(file).ctime
    if check > last_change
      yield file
      last_change = check
    elsif Time.now - last_change > 60
      puts "Nothing's happened for a minute, I'm bored."
      break
    end
  end
end

# Test code
thread = monitor_changes("todo.txt") {|file| puts "Something changed #{file}!"}

puts thread.status
thread.join()


