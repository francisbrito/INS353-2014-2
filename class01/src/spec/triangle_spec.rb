require 'spec_helper'

class Triangle
end

describe Triangle do
    describe '#kind' do
        context 'with valid sides' do
            it 'should return `:equilateral` if all sides are equal length.'
            it 'should return `:isosceles` if two sides are equal length.'
            it 'should return `:scalene` if all sides are different length.'
        end
        context 'with invalid sides' do
            it 'should throw `TriangleError` if any side is not a number.'
            it 'should throw `TriangleError` if sides violate triangle inequality.'
            it 'should throw `TriangleError` if any side is negative or zero.'
        end
    end
end
