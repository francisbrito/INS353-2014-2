require 'spec_helper'

class Calculator
  def add *operands
    # `obj.is_a? Numeric` returns `true` for both Integer and Float.
    sum = 0

    for op in operands do
        raise ArgumentError.new "Invalid argument '#{op}'." if not op.is_a? Numeric

        sum += op
    end

    sum
  end

  def mult num_one, num_two
    raise ArgumentError.new "Invalid argument '#{num_one}'." if not num_one.is_a? Numeric
    raise ArgumentError.new "Invalid argument '#{num_two}'." if not num_two.is_a? Numeric

    num_one * num_two
  end
end

describe Calculator do

  describe "#add" do
    context "with correct params" do
        it "should add an arbitrary number of parameters" do
            calc = Calculator.new

            expect( calc.add 1, 2 ).to eql 3
            expect( calc.add 1, 2, 3 ).to eql 6
            expect( calc.add 1, 2, 3, 4 ).to eql 10
            expect( calc.add -1, 2 ).to eql 1
            expect( calc.add 1.5, 2.5 ).to eql 4.0
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

            # We can't handle that many anyway.
            expect { calc.mult 'Angie', 2 }.to raise_error ArgumentError, "Invalid argument 'Angie'."
            expect { calc.mult 4, 'eyes' }.to raise_error ArgumentError, "Invalid argument 'eyes'."
            expect { calc.mult 'chocolate', 'brownies' }.to raise_error ArgumentError
        end
    end
  end
end