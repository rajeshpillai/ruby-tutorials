# By default method is "public"

# For a private method in Ruby, it can never be called with an explicit receiver. 
# We can (only) call the private method with an implicit receiver.

# This also means we can call a private method from within a class it is declared 
# in as well as all subclasses of this class.

# You cannot access another instance's private methods directly.

# NOTES: 
# some_method cannot be private here. It must be protected because you need it 
# to support explicit receivers. Your typical internal helper methods can usually 
# be private since they never need to be called like this.


# private in Ruby is similar to protected in Java/C++ in that subclasses have access 
# to the method. In Ruby, there is no way to restrict access to a method from 
# its subclasses like you can with private in Java.

# def compare_to(x)
#  self.some_method <=> x.some_method
# end


class Test1
	def main_method1
		method_private
	end

	private
	def method_private
		puts "Inside methodPrivate for #{self.class}"
	end

 	protected
	 def greet
	   puts "Hey, wassup!"
	 end
end

class Test2 < Test1
	def main_method2
		method_private
		greet
	end
end

Test1.new.main_method1  # works
Test2.new.main_method2  #works

# Test1.new.method_private   # NoMethodError
# Test1.new.greet   # Throws protected method error


# Alternate way -> Create all your methods as usaul and mark the respect modifier as shown below

# private :method1, :method2 
# protected :method3, :method4 
