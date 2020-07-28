class Parent
  attr_accessor :v1
  def initialize
    @v1 = "v1"
    puts "Parent is initialized"
  end

  def p1  
    puts "parent->p1 method called"
  end
end

class Child < Parent
  def initialize
    super
    puts "Child is initialized " + v1
  end
end

# Parent.new
Child.new.p1