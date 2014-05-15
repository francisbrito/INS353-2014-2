# Triangle

Write a pretty awesome program that tells if a triangle is:

* equilateral
* isosceles
* scalene

Oh, and also raise a pretty cool error if the triangle is invalid. Also: Write tests for it!

I have provided the base class for your help. Have fun!

```
class TriangleError < RuntimeError
end

class Triangle

  attr_reader :a, :b, :c
  def initialize
  end

  def kind
  end

  private

  def sides
  end

  def equilateral?
  end

  def isosceles?
  end

  def illegal?
  end

  def violates_inequality?
  end

  def impossible_length_side?
  end
end
```
