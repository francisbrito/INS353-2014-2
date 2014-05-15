require 'spec_helper'

class ViolatesTriangleInequalityError < TypeError
end

class ImpossibleLengthError < TypeError
end

class InvalidTypeEror < TypeError
end

class Triangle
end

describe Triangle do
  describe '#kind' do
    context 'with valid sides' do
      it 'should return `equilateral` if all sides are equal.' do
        triangle = Triangle.new 1, 1, 1
        
        expect(triangle.kind).to eql(:equilateral)
      end
      it 'should return `isosceles` if two sides are equal.' do
        triangle = Triangle.new 1, 1, 2
        
        expect(triangle.kind).to eql(:isosceles)
      end
      it 'should return `scalene` if all sides are different.' do
        triangle = Triangle.new 1, 2, 3
        
        expect(triangle.kind).to eql(:scalene)
      end
    end
    context 'with invalid sides' do
      it 'should throw `ViolatesTriangleInequalityError` if a third side is greater than the sum of the first two.' do
        triangle = Triangle.new 1, 2, 4

        expect {triangle.kind}.to raise_error(ViolatesTriangleInequalityError)
      end
      it 'should throw `ImpossibleSideLengthError` if any of the sides is zero or negative.' do
        triangle = Triangle.new 1, -1, 0
        
        expect {triangle.kind}.to raise_error(ImpossibleLengthError) 
      end
      it 'should throw `InvalidTypeError` if any of the of sides is not a number.' do
        triangle = Triangle.new 'not', 'an', 'integer'
        
        expect {triangle.kind}.to raise_error(InvalidTypeError)
      end
    end
  end
end
