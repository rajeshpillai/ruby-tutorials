class Person
  attr_reader :age
  attr_accessor :name

  def initialize (name, ageVar)  # constructor
    @name = name
    @age = ageVar
    # NOTE:
    # Using self within instance method refers to the instance
    # and using self outside instance method refers to the class 

    # self.age = ageVar   # or self.age can also be used
    puts age
  end

  def age= (new_age)
    puts "Setting new age to #{new_age}"
    @age = new_age unless new_age > 120
  end

end


person1 = Person.new("Rajesh", 20) # => 20
puts "My age is #{person1.age}"  # => My age is 20
person1.age = 30  # Try to change the age
puts person1.age
person1.age = 200
puts person1.age
