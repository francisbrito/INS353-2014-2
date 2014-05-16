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
    end
end
