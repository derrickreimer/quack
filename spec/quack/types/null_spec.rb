require "test_helper"

describe Quack::Types::Null do
  describe ".matches?" do
    it "should be true for nil" do
      Quack::Types::Null.matches?(nil).must_equal(true)
    end

    it "should be false for non-nil" do
      Quack::Types::Null.matches?("foo").must_equal(false)
    end
  end

  describe "#to_coerced" do
    it "should return nil" do
      type = Quack::Types::Null.new(nil)
      type.to_coerced.must_be_nil
    end
  end
end
