# Rupees to other currencies
class Numeric
  def euros
    self * 0.013
  end

  def usd
    self * 0.014
  end

end

# Test cases

puts "INR 100 is #{100.euros} euros"
puts "INR 100 is #{100.usd} usd"
