#!/usr/bin/ruby

# Running Periodic Tasks Without cron or at
# Problem
#   You want to write a self-contained Ruby program that performs a task in the background
#   at a certain time, or runs repeatedly at a certain interval.

# The below program waits in the background until a certain time ,
# then prints a message
def background_run_at(time)
  fork do 
    sleep(1) until Time.now >= time 
    yield
  end
end

today = Time.now 
nextrun = Time.local(today.year, today.month, today.day, 12,17,58)
raise Exception, "It's already past lunchtime!" if nextrun < Time.now 

background_run_at(nextrun) { puts "Lunchtime! "}