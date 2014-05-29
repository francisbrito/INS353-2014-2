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
		it "should return the correct title" do
			# the name of the object created in the each block is asserted.
			p = Product.new 'Banana', 5.0, :fruits_n_veggies

			expect(p.title).to eql 'Banana'
		end

		it "should be a string" do
			# the name should be of the class String
			p = Product.new 'Banana', 5.0, :fruits_n_veggies

			expect(p.title.kind_of? String).to eql(true)
		end
	end

	describe "#price" do
		it "should return the correct price" do
			# the price of the object created in the each block is asserted.
			p = Product.new 'Banana', 5.0, :fruits_n_veggies

			expect(p.price).to eql 5.0
		end

		it "should be a float" do
			# the price should be of the class Float
			p = Product.new 'Banana', 5.0, :fruits_n_veggies

			expect(p.price.kind_of? Float).to eql true
		end
	end

	describe "#category" do
		it "should return the correct category" do
			# the category of the object created in the each block is asserted.
			p = Product.new 'Banana', 5.0, :fruits_n_veggies
		
			expect(p.category).to eql :fruits_n_veggies
		end

		it "should be a symbol" do
			# the category should be of the class Symbol
			p = Product.new 'Banana', 5.0, :fruits_n_veggies

			expect(p.category.kind_of? Symbol).to eql true
		end
	end

end
