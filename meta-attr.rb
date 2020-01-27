module Reader
  def attr_reader(*attrs)
    attrs.each do |attr|
      self.class_eval <<-EOT
        def #{attr}; @#{attr};end
      EOT
    end
  end

  def attr_accessor(*attrs)
    attrs.each do |attr|
      define_method(attr) {
        instance_variable_get("@#{attr}")
      }

      define_method("#{attr}=") {
        |val|
        instance_variable_set("@#{attr}", val)
      }
    end
  end

end


class User
  extend Reader
  
  attr_reader :username, :password

  attr_accessor :email
  
  def  initialize
    @username = "user1"
    @password = "password1"
  end

  def display
    puts @username
    puts @email
  end

end

user = User.new
user.display
#  user.username = "rajesh"   #will throw error as no setter
user.email = "test@abc.com"
user.display

