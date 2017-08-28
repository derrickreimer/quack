require "test_helper"

describe Quack::Types::Float do
  describe ".matches?" do
    it "should be true for float strings" do
      Quack::Types::Float.matches?("123.4").must_equal(true)
    end

    it "should be true for floats" do
      Quack::Types::Float.matches?(123.4).must_equal(true)
    end

    it "should be true for negative float strings" do
      Quack::Types::Float.matches?("-123.4").must_equal(true)
    end

    it "should be true for negative floats" do
      Quack::Types::Float.matches?(-123.4).must_equal(true)
    end

    it "should be false for integer strings" do
      Quack::Types::Float.matches?("123").must_equal(false)
    end

    it "should be false for integers" do
      Quack::Types::Float.matches?(123).must_equal(false)
    end

    it "should be false for negative integer strings" do
      Quack::Types::Float.matches?("-123").must_equal(false)
    end

    it "should be false for negative integers" do
      Quack::Types::Float.matches?(-123).must_equal(false)
    end
  end

  describe "#to_coerced" do
    it "should return original value if its a Float" do
      type = Quack::Types::Float.new(2.4)
      type.to_coerced.must_equal(2.4)
    end

    it "should cast float strings to Float" do
      type = Quack::Types::Float.new("123.4")
      type.to_coerced.must_equal(123.4)
      type.to_coerced.class.must_equal(Float)
    end
  end
end
