require 'spec_helper'

class Triangle
    attr_reader :a, :b, :c

    def initialize(a, b, c)
        @a = a
        @b = b
        @c = c
    end

    def kind
    end
end

describe Triangle do
    describe '#kind' do
        context 'with valid sides' do
            it 'should return `:equilateral` if all sides are equal length.' do
                triangle = Triangle.new 1, 1, 1

                expect(triangle.kind).to eq :equilateral
            end
            it 'should return `:isosceles` if two sides are equal length.' do
                triangle = Triangle.new 1, 1, 2

                expect(triangle.kind).to eq :isosceles
            end
            it 'should return `:scalene` if all sides are different length.' do
                triangle = Triangle.new 1, 2, 3

                expect(triangle.kind).to eq :scalene
            end
        end
        context 'with invalid sides' do
            it 'should throw `TriangleError` if any side is not a number.'
            it 'should throw `TriangleError` if sides violate triangle inequality.'
            it 'should throw `TriangleError` if any side is negative or zero.'
        end
    end
end
