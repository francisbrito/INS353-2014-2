require 'spec_Helper'

class Calculator
  def add num_one, num_two
    num_one +  num_two
  end
end

describe Calculator do

  describe "#add" do
    context "with correct params" do
      it "should add two numbers" do
        calc = Calculator.new
        expect(calc.add(1,3)).to eql(4)
      end
    end

    context "with incorrect params" do
      it "should throw an error"
    end
  end

  describe "#mult" do
    it "should multiply two numbers"
  end
end