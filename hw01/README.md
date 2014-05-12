# Homework 01 - 2 points

During class we built a really simple calculator using TDD, we developed the first method ```def add(num_one, num_two)``` and now is your turn to build ```def multiply(num_one, num_two)```

**Bonus: 1 extra point if you can make the #add method to handle N amount of params and properly test it.**


# Setup

In order to setup your project all you need is a ```spec``` folder with two files:

- ```spec_helper.rb```
- ```calculator_spec.rb```

Here's the ```spec_helper.rb```:

```
RSpec.configure do |config|
  config.color_enabled = true
  config.formatter = :documentation
end
```

And here's the 50% of the ```calculator_spec.rb```:

```
require 'spec_helper'

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
```

## Help?

- Remember that ```gem install rspec``` is your friend.
- The command for running your tests is ```rspec```. It must be ran in the top level, if you try to run it within the spec folder it'll error out.
- Any other questions, feel free to open an Issue.

# Good Luck!
