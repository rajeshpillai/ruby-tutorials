# Identifying Free Variables
# A free variable is a variable that is defined in a parent scope. Let’s look at an
# example that will make this clearer. 

# We’ll modify the program we just wrote
# to use lambdas instead. Lambdas are Ruby’s version of anonymous functions
# found in other languages. Type this program into your irb session:

# Let's create a lambda (internally lambda and proc are same)
drawing_gag = lambda do |msg|
 lambda do
	 prefix = "I will not"
	 "#{prefix} #{msg}"
 end
end

inner_lambda = drawing_gag.call("draw a drawing")

p inner_lambda

# Now call the inner lambda
p inner_lambda.call   


# Whenever an inner lambda refers to a variable that is not declared within it,
# but that variable is declared in the parent scope of that lambda, that is a free
# variable.

# At this stage, you almost have all the tools and knowledge needed to point
# out a closure. You know what lexical scoping is and how it works. You also
# know how to identify a free variable. Now, you need to know what separates
# closures and non-closures.

# Rules of Identifying a Closure
# Recall the definition of a closure:
# 1. It needs to be a function...
# 2. whose body references some variable that...
# 3. is declared in a parent scope.
# Since Ruby doesn’t have the concept of a traditional function, we’re going to
# be a bit loose with the definition. In the context of Ruby, this means a block,
# Proc, or lambda.
# However, being a block, Proc, or lambda is not enough. The body must contain
# at least one variable that is declared in the parent scope. What kind of variable
# is that? That’s right, a free variable.