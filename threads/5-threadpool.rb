# Thread-pool
# How to manage multi-threading? For example, 
# you want to run only 2, 5 or 10 threads. 
# If you’re going to do it, use Thread-pool pattern. 
# It can help you set thread-limit.

# ALSO CREATING THREADS IS COSTLY


# https://apidock.com/ruby/Kernel/catch
# thread pool class
class ThreadPool
  def initialize(size)
    @size = size
    @jobs = Queue.new
    @pool = Array.new(@size) do |i|
      Thread.new do
        Thread.current[:id] = i
        catch(:exit) do
          loop do
            job, args = @jobs.pop
            job.call(*args)
          end
        end
      end
    end
  end

  # add a job to queue
  def schedule(*args, &block)
    @jobs << [block, args]
  end

  # run threads and perform jobs from queue
  def run!
    @size.times do
      schedule { throw :exit }
    end
    @pool.map(&:join)
  end
end



# Example 

# an instance of ThreadPool with 5 threads
pool = ThreadPool.new(5)


# add 20 tasks to query
20.times do |i|
  pool.schedule do
    sleep_time = rand(4) + 2
    sleep(sleep_time)
    puts "Job #{i} with sleep time #{sleep_time}, finished by thread #{Thread.current[:id]}"
  end
end

# run all threads
pool.run!