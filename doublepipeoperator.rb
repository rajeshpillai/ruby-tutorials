class Person
  attr_reader :age
  attr_accessor :name

  def initialize (name, ageVar)  # constructor
    @name = name
    self.age = ageVar
  
    puts age
  end

  def age= (new_age)
    @age ||= 5   #default
    puts "Setting new age to #{new_age}"
    @age = new_age unless new_age > 120
  end

end


person1 = Person.new("Rajesh", 130) # => 5
puts "My age is #{person1.age}"  # => My age is 20
person1.age = 10  # Change to 10
puts person1.age  # => 10
person1.age = 200 # Try to change to 200
puts person1.age  # => 10 (still)
