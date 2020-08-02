class Parent
  def self.inherited(subclass)
    puts "#{subclass} inherits from Parent"
  end
end

class Child < Parent
end