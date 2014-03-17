require "test_helper"

describe Quack::Types::Integer do
  describe ".matches?" do
    it "should be true for integer strings" do
      Quack::Types::Integer.matches?("123").must_equal(true)
    end

    it "should be true for Fixnum" do
      Quack::Types::Integer.matches?(123).must_equal(true)
    end

    it "should be true for Bignum" do
      num = 232305722798259244150093798251441
      Quack::Types::Integer.matches?(num).must_equal(true)
    end

    it "should be false for float strings" do
      Quack::Types::Integer.matches?("123.4").must_equal(false)
    end

    it "should be false for floats" do
      Quack::Types::Integer.matches?(123.4).must_equal(false)
    end
  end

  describe "#to_coerced" do
    it "should return original value if its a Fixnum" do
      type = Quack::Types::Integer.new(2)
      type.to_coerced.must_equal(2)
    end

    it "should return original value if its a Bignum" do
      num = 232305722798259244150093798251441
      type = Quack::Types::Integer.new(num)
      type.to_coerced.must_equal(num)
    end

    it "should cast integer strings to Fixnum" do
      type = Quack::Types::Integer.new("123")
      type.to_coerced.must_equal(123)
      type.to_coerced.class.must_equal(Fixnum)
    end
  end
end