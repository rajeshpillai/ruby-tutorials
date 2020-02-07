require "active_support/inflector"

@@db = {
  users: [{id:1, username:"user1"}, {id:2, username:"user2"}],
  tasks: [{id:1, title:"task1"}, {id:2,title:"task"}]
}

class Model 
   attr_accessor :data

   


  def initialize
    class_name = self.class.to_s.downcase.pluralize  # users
    
    puts "#{self} #{class_name} is getting initialized..."
  
   
    @@data = @@db[:"#{class_name}"] 
  
  end

 
  def self.connect
    class_name = self.class.to_s.downcase.pluralize  # users
    puts "#{self} #{class_name} is getting initialized..."
   
    @@data = @@db[:"#{class_name}"] 
  end

  connect


  class << self
    def data
      @@data
    end
  end

  #def self.data
  #  @@data
  #end

  def self.method_missing(method, *args, &block)
    puts "#{method} with #{args} is not found"
    class_name = self.to_s.downcase.pluralize  # users

    method_tokens = method.to_s.split('_')
    puts method_tokens[2]     # the last token (find_by_id => id)
    

  end

end

class User < Model
  
  
end

class Task < Model

end


u = User.new
puts u

puts  User.find_by_id(1)

puts "Users table"
puts @@db[:users]

puts "Tasks table"
puts @@db[:tasks]


puts "Accessing data using model"

puts User.data
puts "----------------------------"

puts Task.data


