#!/home/rajesh/.rbenv/shims/ruby


# Running a Code Block Periodically

# Problem
# You want to run some Ruby code (such as a call to a shell command) repeatedly at a
#   certain interval.
# Solution
#   Create a method that runs a code block, then sleeps until it’s time to run the block
#  again:


# The implementation of every_n_seconds deducts from the sleep time the time spent
# running the code block. This ensures that calls to the code block are spaced evenly
# apart, as close to the desired interval as possible. If you tell every_n_seconds to call a
# code block every five seconds, but the code block takes four seconds to run,
# every_n_seconds only sleeps for one second. If the code block takes six seconds to
# run, every_n_seconds won’t sleep at all: it’ll come back from a call to the code block,
# and immediately yield to the block again.

# If you always want to sleep for a certain interval, no matter how long the code block
# takes to run, you can simplify the code:

# def every_n_seconds(n)
#   loop do
#     yield
#     sleep(n)
#   end
# end

def every_n_seconds(n)
  loop do
    before = Time.now
    yield
    interval = n-(Time.now-before)  
    puts "Interval: " , interval
    sleep(interval) if interval > 0
  end
end

every_n_seconds(2) do
  puts "At the beep, the time will be #{Time.now.strftime("%X")}... beep!"
end
