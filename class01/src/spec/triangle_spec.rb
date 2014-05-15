require 'spec_helper'

# •equilateral
# •isosceles
# •scalene

class Triangle
end

describe Triangle do
  describe '#isosceles' do
    it 'should return true if two of the sides are equal'
  end
  describe '#equilateral' do
    it 'should return true if all of the sides are equal'
  end
  describe '#scalene' do
    it 'should return true if all of the sides are different'
  end
end