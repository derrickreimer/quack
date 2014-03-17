require "test_helper"

describe Quack::Types::String do
  describe ".matches?" do
    it "should be true" do
      Quack::Types::String.matches?("foo").must_equal(true)
    end
  end

  describe "#to_coerced" do
    it "should cast integers to strings" do
      type = Quack::Types::String.new(123)
      type.to_coerced.must_equal("123")
    end
  end
end