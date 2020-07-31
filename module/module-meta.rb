def custom_extend(module_name)
	module_name.singleton_methods(false).each do |method|
  		define_singleton_method(method) do |*args, &block|
    		module_name.singleton_method(method).call(*args, &block)
  		end
	end
end


module Feature1
	
	def self.s1 
		puts "s1"
	end

	def f1
		puts "f1"
	end

	def f2
		puts "f2"
	end
	
end

class App
	include Feature1
	extend Feature1
	custom_extend Feature1

end

app = App.new 

app.f1 
App.f2 
Feature1.s1 

App.s1 