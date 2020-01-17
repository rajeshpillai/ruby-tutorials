# Converts USD, yen, euro, to INR rupee
class Numeric
  @@currencies = {'yen' => 1.55, 'euro'=>0.013, 'usd' => 0.014}

  # capture all args in case we have to call super
  def method_missing(method_id, *args, &block)
    currency = method_id.to_s.gsub(/s$/,'')
    #puts "method #{method_id}"
    #puts "currency #{currency}"

    if @@currencies.has_key?(currency)
      self / @@currencies[currency]
    else
      super
    end
      
  end

end


# Test cases

puts "100000 yen is #{100000.yen.round(3)} INR"
puts "100000 yen is #{100000.yens.round(3)} INR"
puts "100000 euro is #{100000.euro.round(3)} INR"
puts "100000 usd is #{100000.usd.round(3)} INR"


