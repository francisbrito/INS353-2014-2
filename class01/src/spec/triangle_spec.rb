require 'spec_helper'

class Triangle
    attr_reader :a, :b, :c

    def initialize(a, b, c)
        @a = a
        @b = b
        @c = c
    end

    def kind
        raise TriangleError if illegal? or violates_inequality? or impossible_length_side?

        if equilateral?
            :equilateral
        elsif isosceles?
            :isosceles
        else
            :scalene
        end
    end

    private

    def sides
        @sides ||= [@a, @b, @c]
    end

    def equilateral?
        comparee_side = @a
        sides.all? {|side| side == comparee_side}
    end

    def isosceles?
        (@a == @b and @a != @c) or (@b == @c and @b != @a) or (@c == @a and @c != @b)
    end

    def illegal?
        sides.any? {|side| !side.is_a? Numeric}
    end

    def violates_inequality?
        @a + @b < @c or @a + @c < @b or @c + @b < @a
    end

    def impossible_length_side?
        sides.any? {|side| side <= 0}
    end
end

class TriangleError < RuntimeError
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
            it 'should throw `TriangleError` if any side is not a number.' do
                triangle = Triangle.new 'not', 'a valid', 'number'

                expect {triangle.kind}.to raise_error TriangleError
            end
            it 'should throw `TriangleError` if sides violate triangle inequality.' do
                # NOTE: The sum of the lengths of any two sides must be greater
                #       than or equal to the length of the remaining side.
                triangle = Triangle.new 1, 3, 1

                expect {triangle.kind}.to raise_error TriangleError
            end
            it 'should throw `TriangleError` if any side is negative or zero.' do
                # NOTE: For some reason `Triangle.new -1, -1, -1` raise a warning.
                pessimist_triangle = Triangle.new(-1, -1, -1)
                expect {pessimist_triangle.kind}.to raise_error TriangleError

                neutral_triangle = Triangle.new 0, 0, 0
                expect {neutral_triangle.kind}.to raise_error TriangleError
            end
        end
    end
end
