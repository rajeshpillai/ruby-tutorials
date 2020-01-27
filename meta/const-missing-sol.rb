class Object
  def self.const_missing(c)
    require "./cat"
   Cat 
  end
end

Cat.new.talk

