# The Foundations of a Closure
# Let’s begin with a definition of a closure. A closure is essentially a function
# whose body references a variable that is declared in the parent scope.


# The key to understanding closures is to grasp two other programming language
# concepts: lexical scoping and free variables. Let’s look at lexical scoping first,
# and then dive into free variables.


# Lexical Scoping: Closest Variable Wins

# Lexical scoping rules serve to answer one question: what is the value of this
# variable at this line? In short, lexical scoping says that whichever assignment
# to a variable that is the closest gets that value.
# The value of a variable x is given by the innermost statement that declares x.
# Furthermore, the area in a program where a variable maintains a value is
# called the scope of that variable.


# Lexical scoping is sometimes known by another term—
# static scoping.

msg = "draw a painting"

3.times do 
	prefix = "I will not"
	puts "#{prefix} #{msg}"
end

#puts prefix  # will not work

# do .. end creates a new scope. Within the block, prefix is declared and has the
# value "I will not". msg is more interesting. 

# It is not declared within the block, but
# in the outermost, or parent, scope. The inner scope has access to the parent
# scope. Because of this, msg continues to have the value "drive the principal's car"

# You have just seen that the inner scope has access to the parent scope. Does
# the opposite hold true? For example, can prefix be accessed outside of the
# block? You can easily find out using irb again:

