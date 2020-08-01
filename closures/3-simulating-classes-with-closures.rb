# Simulating Classes with Closures

# If you think about it, classes are a way of packaging up data and behavior.
# Instances created of a class are distinct from each other. In other words, each
# instance has its own state. Closures also provide that functionality. Let’s see
# how with an example.

# Say you want to build a very simple counter program. The counter program
# can do the following:
# • Get the current value of the counter.
# • Increment the counter.
# • Decrement the counter.

# This is the essence of what most classes do: retrieve and modify data. Here’s
# one possible implementation of a Counter class:

class Counter
	def initialize
		@x = 0
	end

	def get_x
		@x
	end
	
	def incr
		@x += 1
	end
	
	def decr
		@x -= 1
	end
end

c = Counter.new 
p c.incr
p c.incr 
p c.decr


# Now let's simulate the same behaviour using lambda
CounterLambda = lambda do 
	x = 0
	get_x = lambda { x }
	incr = lambda { x += 1}
	decr = lambda { x -= 1}

	{get_x: get_x, incr: incr, decr: decr}
end


p "Counter Lambda 1"
c1 = CounterLambda.call   # This will return the methods 

p c1[:incr].call 
p c1[:incr].call 
p c1[:incr].call 
p c1[:decr].call 


# Let’s create another counter, c2. Is c2 distinct from c1? In other words, do they
# behave like distinct objects?

p "Counter Lambda 2"
c2 = CounterLambda.call   # This will return the methods 

p c2[:incr].call 
p c2[:incr].call 
