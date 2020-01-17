# Converts USD to yen, euro, and rupee
class Numeric
  @@currencies = {'yen' => 0.013, 'euro'=>1.292, 'rupee' => 0.019}

  # capture all args in case we have to call super
  def method_missing(method_id, *args, &block)
    currency = method_id.to_s.gsub(/s$/,'')
    if @@currencies.has_key?(currency)
      self * @@currencies[currency]
    else
      super
    end

      
  end
end


# Test cases

puts "100 USD is #{100.yen} yen"
puts "100 USD is #{100.euro} euro"
puts "100 USD is #{100.rupee} inr"
