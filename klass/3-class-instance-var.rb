# Solution: Class-Instance Variable

# By using instance variables, each subclass gets its own variable 
# so @sound does not get stepped over, and each subclass can 
# configure the variable as needed. So, how does it work?

# NOTES: 

# Classes in Ruby are plain objects, instances of the Class class.
# Because each class is an object, it can have instance variables 
#    just like any other Ruby object.


# The key practical difference is that class variables (@@) are 
# shared among a class and all of its descendants, whereas 
# class instance variables (@) are not shared and each class has 
# separate instance variables just like you would expect from 
# different objects.

class Animal
  def self.sound
    @sound   # only in class method you can directly refer the class/instance variable
  end

  def talk
    self.class.sound  # in instance method you have to use this approach
  end
end

class Dog < Animal
  @sound = 'woof!'  # class instance variable
end

class Cat < Animal
  @sound = 'meow!'
end

puts Dog.new.talk # 'woof!'

puts Cat.new.talk # 'meow!'

puts Cat.sound