require "active_support/inflector"

$db = {
  users: [{id:1, username:"user1"}, {id:2, username:"user2"}],
  tasks: [{id:1, title:"task 1", completed: true}, {id:2,title:"task 2", completed: false}, {id:3, title: "task 3", completed: true}]
}

class Model 
  attr_accessor :data

  def initialize
    class_name = self.class.to_s.downcase.pluralize  # users
    
    puts "#{self} #{class_name} is getting initialized..."
   
    # @@data = $db[:"#{class_name}"] 
  
  end

 
  def self.connect
    class_name = to_s.downcase.pluralize  # users
    puts "#{self} #{class_name} is getting initialized..."
   
    @data = $db[:"#{class_name}"] 
    puts @data
  end

  #connect

  # class level variable
  # class << self
  #   def data
  #     @@data
  #   end
  # end

  def self.data
   @data
  end

  def self.method_missing(method, *args, &block)
    #puts "#{method} with #{args} is not found"
    class_name = self.to_s.downcase.pluralize  # users

    method_tokens = method.to_s.split('_')
    search_field = method_tokens[2]     # the last token (find_by_id => id)
    
    if method_tokens[0] == "find"
      puts "finding #{class_name} by #{search_field}"
      puts "Search data: ", self.data

      results = []
      self.data.each do |row|
        if row.key? (search_field.to_sym)  
          if args[0] == row[search_field.to_sym]
            results << row
          end
        end
      
      end
      results
      
    else
      super  
    end
  end

end

class User < Model
  connect
end

class Task < Model
  connect
end

# User.connect

user1 = User.find_by_id(2)
puts user1


# Task.connect
task = Task.find_by_id(1)
puts task

tasks = Task.find_by_completed(true)
puts tasks

puts "USERS: ", User.data
puts "TASKS: ", Task.data


