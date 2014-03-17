require "test_helper"

describe Quack::Types::Boolean do
  describe ".matches?" do
    it "should be true for true" do
      Quack::Types::Boolean.matches?(true).must_equal(true)
    end

    it "should be true for false" do
      Quack::Types::Boolean.matches?(false).must_equal(true)
    end 

    it "should be true for 'true' string" do
      Quack::Types::Boolean.matches?("true").must_equal(true)
    end

    it "should be true for 'false' string" do
      Quack::Types::Boolean.matches?("false").must_equal(true)
    end

    it "should be false for aritrary strings" do
      Quack::Types::Boolean.matches?("foo").must_equal(false)
    end
  end

  describe "#to_coerced" do
    it "should return true if original value is true" do
      type = Quack::Types::Boolean.new(true)
      type.to_coerced.must_equal(true)
    end

    it "should return true if original value is true" do
      type = Quack::Types::Boolean.new(false)
      type.to_coerced.must_equal(false)
    end

    it "should cast 'true' string to true" do
      type = Quack::Types::Boolean.new("true")
      type.to_coerced.must_equal(true)
    end

    it "should cast 'false' string to true" do
      type = Quack::Types::Boolean.new("false")
      type.to_coerced.must_equal(false)
    end
  end
end