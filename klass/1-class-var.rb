class Animal
  @@animals = []  # class variable shared among sub classes

  def self.all
    @@animals
  end

  def other_species
    @@animals - [self.class]
  end
end

class Dog < Animal
  @@animals << self
end

class Cat < Animal
  @@animals << self
end

puts Animal.all
# [Dog, Cat]

puts Cat.new.other_species
# [Dog]

puts Dog.new.other_species
# [Cat]