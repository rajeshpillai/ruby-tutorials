module Contact
  attr_accessor :name
  def print_name
    puts "Name: #{@name}"
  end
end

class Person
  include Contact
end

class Company
  include Contact
end


person = Person.new
person.name = "Rajesh"
person.print_name # => Name: Rajesh

company = Company.new
company.name = "Algorisys Technologies"
company.print_name # => Name: Algorisys Technologies


