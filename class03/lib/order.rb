class Order
	attr_accessor :products

	# Remember that working with YAML files YAML::load and YAML::dump are your friends!

	def initialize
	  	# loading or not loading should be the key here.
    end
 
    def filter_by_category
    	# Perhaps you could use the select method for arrays :)
    end

    def filter_by_price
    	# Perhaps the select method could work here too!
    end
 
    def add_product
      # Remember stacks & queues? Pushing might be the answer.
    end
 
    def get_product
    	# you query products by a product title but the catchy thing here is
    	# that if there are multiple matches only the first one is returned.
    end
 
    def save
    	# maybe you could try dumping around here :)
    end
end