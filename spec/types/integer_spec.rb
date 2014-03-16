require "test_helper"

describe Quack::Types::Integer do
  describe ".matches?" do
    it "should be true for integer strings" do
      Quack::Types::Integer.matches?("123").must_equal(true)
    end

    it "should be true for integers" do
      Quack::Types::Integer.matches?(123).must_equal(true)
    end

    it "should be false for float strings" do
      Quack::Types::Integer.matches?("123.4").must_equal(false)
    end

    it "should be false for floats" do
      Quack::Types::Integer.matches?(123.4).must_equal(false)
    end
  end

  describe "#cast" do
    it "should return original value if its a Fixnum" do
      type = Quack::Types::Integer.new(2)
      type.cast.must_equal(2)
    end

    it "should cast integer strings to Fixnum" do
      type = Quack::Types::Integer.new("123")
      type.cast.must_equal(123)
      type.cast.class.must_equal(Fixnum)
    end
  end
end