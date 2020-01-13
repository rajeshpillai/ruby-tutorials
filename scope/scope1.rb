v1 = "outside"

class MyClass
  def my_method
    # p v1 EXCEPTION THROWN - no such variable exists within class
    v1 = "inside" #  new local variable
    p v1
    p local_variables #prints all local variables
  end
end

p v1  # => outsise
obj = MyClass.new
obj.my_method  # => inside
               # => [:v1]

p local_variables # => [:v1, :obj]
p self # => main
