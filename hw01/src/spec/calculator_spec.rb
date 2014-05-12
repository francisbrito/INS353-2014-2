require 'spec_helper'

class Calculator
  def add num_one, num_two
    # `obj.is_a? Numeric` returns `true` for both Integer and Float.
    raise ArgumentError.new "Invalid argument '#{num_one}'." if not num_one.is_a? Numeric
    raise ArgumentError.new "Invalid argument '#{num_two}'." if not num_two.is_a? Numeric

    num_one + num_two
  end

  def mult num_one, num_two
    raise ArgumentError.new "Invalid argument '#{num_one}'." if not num_one.is_a? Numeric or not num_two.is_a? Numeric

    num_one * num_two
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
      it "should throw an error" do
        calc = Calculator.new

        # TODO: Think of other invalid arguments besides strings.
        # NOTE: Using a scope is required, since RSpec runs the bit of code
        #       passed to `expect`, without it `calc.add 'invalid', 'params'`
        #       would throw breaking the test.
        #
        #       This is analogous to doing
        #       ```js
        #       expect(function() { obj.funcThatThrows(); }).toThrow();
        #       ```
        #       in Mocha/Jasmine.
        expect { calc.add 'chunky bacon', 2 }.to raise_error ArgumentError, "Invalid argument 'chunky bacon'."
        expect { calc.add 2, 'pet ham' }.to raise_error ArgumentError, "Invalid argument 'pet ham'."
        expect { calc.add 'one two', 'one two three four five' }.to raise_error ArgumentError
      end
    end
  end

  describe "#mult" do
    context "with correct params" do
        it "should multiply two numbers" do
            calc = Calculator.new

            expect(calc.mult 2, 2).to eql 4
            expect(calc.mult -1, 2).to eql -2
        end
    end
    context "with incorrect params" do
        it "should throw an error" do
            calc = Calculator.new

            expect { calc.mult 'invalid', 'params' }.to raise_error(ArgumentError)
        end
    end
  end
end