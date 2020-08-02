class Parent
  def self.inherited(subclass)
    subclass.define_method :parent_name do
      "Daddy"
    end
  end
end

class Child < Parent
end

p Child.new.parent_name # => "Daddy"