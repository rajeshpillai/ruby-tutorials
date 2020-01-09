class Router
  def initialize
    @routes = {}
  end

  def match(options)
    @routes.update(options)
  end

   # this method receives block of code
   def routes(&block) #convert proc to block
     # yield -> will execute block of code in the main context
     instance_eval(&block)  #convert proc to block again
     puts @routes
   end
end

Router.new.routes do 
  match "/users" => "users#index"
  match "/login" => "sessons#new"
end
