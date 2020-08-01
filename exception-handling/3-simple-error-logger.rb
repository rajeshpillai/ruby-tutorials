def error_logger(e) 
  File.open('errors.txt', 'a') do |file| 
    file.puts e
  end
end

class Registration  
  # Define default getter methods, but not setter methods.  
  attr_reader :first, :last  
  # When someone tries to set a first name, enforce rules about it.  
  def first=(first)  
    if first == nil or first.size == 0  
      raise ArgumentError.new("First name is required for #{self.class}",)  
    end  
    first = first.dup  
    first[0] = first[0].chr.capitalize  
    @first = first  
  end  
  
  # When someone tries to set a last name, enforce rules about it.  
  def last=(last)  
    if last == nil or last.size == 0  
      raise ArgumentError.new("Last name is required for #{self.class}",)  
    end  
    @last = last  
  end  
  
  def full_name  
    "#{@first} #{@last}"  
  end  
  # Delegate to the setter methods instead of setting the instance  
  # variables directly.  
  def initialize(first, last)  
    self.first = first  
    self.last = last  
  end  
end  

begin   
  james = Registration.new('James', 'Bond')  
  james.first = 'James 007'  
  p james.full_name 

  byomkesh = Registration.new('Byomkesh', 'Bakshi')  
  p byomkesh.full_name 
  byomkesh.first = 'Byomkesh Detective'  
  byomkesh.first = nil  

rescue ArgumentError => e 
  p e
  error_logger(e)
end