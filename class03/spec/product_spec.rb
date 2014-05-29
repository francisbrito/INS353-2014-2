require 'spec_helper.rb'

describe Product do

	before :each do
	end

	describe "When creating a new a product" do
		context "With valid parameters" do
			it "should take 3 parameters and return a product object" do
				expect { p = Product.new 'Banan' }.to raise_error
				expect { p = Product.new 'Banana', 5.0 }.to raise_error

                		p = Product.new('Banana', 5.0, :fruits_n_veggies)
                		p.should_not be_nil 
            		end
		end
	end

	describe "#title" do
		it "should return the correct title"
			# the name of the object created in the each block is asserted.

		it "should be a string"
			# the name should be of the class String
	end

	describe "#price" do
		it "should return the correct price"
			# the price of the object created in the each block is asserted.

		it "should be a float"
			# the price should be of the class Float
	end

	describe "#category" do
		it "should return the correct category"
			# the category of the object created in the each block is asserted.

		it "should be a symbol"
			# the category should be of the class Symbol
	end

end
