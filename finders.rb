require "active_support/inflector"

$db = {
  users: [{id:1, username:"user1"}, {id:2, username:"user2"}],
  tasks: [{id:1, title:"task 1", completed: true}, {id:2,title:"task 2", completed: false}, {id:3, title: "task 3", completed: true}]
}


class Model 

  def initialize 
    puts "#{self} #{class_name} is getting initialized..."
  end

  def self.connect
    class_name = to_s.downcase.pluralize   #user -> users
    #puts "#{self} #{class_name} is getting initialized..."

    @data = $db[:"#{class_name}"]  #class instance variable

    p @data 
  end

  def self.data 
    @data
  end

  def self.method_missing(method, *args, &block)
    #p method, *args 

    class_name = self.to_s.downcase.pluralize 

    method_tokens = method.to_s.split('_')
    #p method_tokens

    search_field = method_tokens[2]   # extract the search field

    if method_tokens[0] == "find"
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
  p User.data
end 

class Task < Model
  connect
  p Task.data
end

# User -> u1, u2, u3 
# User < Model  @data  User.data => users: {}
# Task < Model  @Task  Task.data => tasks: {}

# Task.connect
puts "Find task by id 1"
task = Task.find_by_id(1) { puts "block"}
puts task

tasks = Task.find_by_completed(true)
puts tasks


user1 = User.find_by_id(2)
puts user1 



puts "Find tasks by completed: true"
tasks = Task.find_by_completed(true)
puts tasks


puts "Find tasks by completed: false"
tasks = Task.find_by_completed(false)
puts tasks

puts "Find tasks by title"
tasks = Task.find_by_title("task 1")
puts tasks