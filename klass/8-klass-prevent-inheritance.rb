# https://blog.appsignal.com/2019/09/03/inherited-hook-method-and-parenting.html

# class AddFirstnameToUsers < ActiveRecord::Migration
# end

# # => StandardError (Directly inheriting from ActiveRecord::Migration is not supported..)

module ActiveRecord
  class Migration
    def self.inherited(subclass) #:nodoc:
      super
      p subclass.superclass
      if subclass.superclass == Migration
        raise StandardError, "Directly inheriting from ActiveRecord::Migration is not supported. " \
          "Please specify the Rails release the migration was written for:\n" \
          "\n" \
          "  class #{subclass} < ActiveRecord::Migration[4.2]"
      end
    end

    def self.[](version)
      self
    end

  end
end

class AddFirstnameToUsers  < ActiveRecord::Migration[6.0]

end

# The below will not work
# class MyClass < ActiveRecord::Migration

# end
