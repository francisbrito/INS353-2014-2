require 'spec_helper'

class Triangle
end

describe Triangle do
  describe '#kind' do
    context 'with valid sides' do
      it 'should return `equilateral` if all sides are equal.'
      it 'should return `isosceles` if two sides are equal.'
      it 'should return `scalene` if all sides are different.'
    end
    context 'with invalid sides' do
      it 'should throw `ViolatesTriangleInequalityError` if a third size is greater than the sum of the first two.'
      it 'should throw `ImpossibleSideLengthError` if any of the sides is zero or negative.'
      it 'should throw `InvalidTypeError` if any of the of sides is not a number.'
    end
  end
end