require 'spec_helper.rb'

class Order
    attr_reader :products
    def initialize(file_path = nil)
        @products = []
        @products = YAML::load_file file_path if file_path
    end
    def filter_by_category(category)
        products
    end
end

describe Order do
	
	before :all do
		orders = [
			Product.new("Mouse", 21.00, :electronics),
			Product.new("Keyboard", 25.00, :electronics),
			Product.new("Bed", 111.00, :home),
			Product.new("Pen", 1.50, :office),
			Product.new("Key", 4.20, :home),
			Product.new("Printer", 121.00, :electronics)
		]
		File.open "products.yml", 'w' do |f|
			f.write YAML::dump orders
		end
	end

	before :each do
		# instantiate a new order while loading the products.yml file
                @order = Order.new 'products.yml'
	end

	describe "When creating a new Order" do

		context "with no parameters" do
			it "has no products" do
				# A new order instantiated with no yml file should have 0 products
                                o = Order.new

                                expect(o.products.size).to eql 0
                        end
		end

		context "with a YAML file" do
			it "has 6 products" do
				# A new order instantiated with a yml file should have 6 products
                                o = Order.new 'products.yml'                        

                                expect(o.products.size).to eql 6
                        end
		end

	end

	describe "When working with orders" do
		
		it "can filter products by category" do
			# assertion for this method should be against the quantity of objects returned
                        electronics = @order.filter_by_category :electronics      

                        expect(electronics.size).to eql 3
                end

		it "can add & retrieve new products "
			# assertion for this method should be agaist the instance class of the returned object we save.

		it "can get products by a price range"
			# assertion for this method should be against the quantity of objects returned

		it "can save your order to a file"
			# Save the order to a file, retrieve it and then compare with the previous
	end
	

end
