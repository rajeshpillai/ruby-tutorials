# $ for globals
$global = "Available Everywhere"

class Invoice
	@@file_path = "/somepath"   # class variables
	
	attr_accessor :id, :qty, :unitprice, :total

	def initialize(**args) 
		p args
		@qty = args[:qty]
		@unitprice = args[:unitprice]
	end

	def calculate_total
		p "Global access #{$global}"
		qty * unitprice
	end

	# class var reader
	def self.file_path 
		@@file_path
	end
end	

class ProformaInvoice < Invoice  

end

inv = Invoice.new(qty: 5, unitprice: 10)

puts "Invoice: "
p "Quantity: #{inv.qty}"
p "Total: #{inv.calculate_total}"
p Invoice.file_path


puts "ProformaInvoice: "
pinv = ProformaInvoice.new(qty: 15, unitprice: 10)
p "Total: #{pinv.calculate_total}"
p ProformaInvoice.file_path