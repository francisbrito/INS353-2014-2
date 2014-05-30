class Product
	attr_accessor :title, :price, :category

	def initialize(title, price, category)
		raise_error TypeError if !title or !price or !category

		@title = title
		@price = price
		@category = category
	end
        def to_s
            title + ' ' + price.to_s + ' ' + category.to_s 
        end
	# attribute names should be title, price, category
	# where title is a String
	# where price is a Float
	# where category is a Symbol

end
