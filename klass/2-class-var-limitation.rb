# What if we need to store meta dta or configuration for each subclass

class Animal
  @@sound = '?'

  def talk
    @@sound
  end
end

class Dog < Animal
  @@sound = 'woof!'
end

class Cat < Animal
  @@sound = 'meow!'
end

puts Dog.new.talk # "meow!"

puts Cat.new.talk # "meow!"

# Because class variables are shared between the parent class and 
# its subclasses, the value of @@sound gets stepped over by the 
# last subclass, rather than it taking a different value for each 
# subclass as intended.