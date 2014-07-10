require 'rails_helper'

RSpec.describe Product, :type => :model do

  it "should respond to name"
  it "should respond to description"
  it "should respond to price"

  describe "#name" do
    it "should not save when name is not present" do
      product = Product.new
      expect(product.save).to be_false
    end
  end

end
