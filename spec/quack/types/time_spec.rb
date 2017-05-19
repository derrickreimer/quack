require "test_helper"

describe Quack::Types::Time do
  describe ".matches?" do
    it "should be true for Time objects" do
      input = Time.new(2014, 3, 22)
      Quack::Types::Time.matches?(input).must_equal(true)
    end

    it "should be true for ISO 8601 UTC times" do
      input = "2014-03-22T03:00:00Z"
      Quack::Types::Time.matches?(input).must_equal(true)
    end

    it "should be true for ISO 8601 non-UTC times" do
      input = "2014-03-22T03:00:00-08:00"
      Quack::Types::Time.matches?(input).must_equal(true)
    end

    it "should be true for YMD formatted times" do
      input = "2014-03-22"
      Quack::Types::Time.matches?(input).must_equal(true)
    end

    it "should be false for invalid dates" do
      Quack::Types::Time.matches?("3/22/2014").must_equal(false)
    end
  end

  describe "#to_coerced" do
    it "should cast ISO 8601 UTC times" do
      type = Quack::Types::Time.new("2014-03-22T03:00:00Z")
      expected = Time.new(2014, 3, 22, 3, 0, 0, "+00:00")
      type.to_coerced.must_equal(expected)
    end

    it "should cast ISO 8601 non-UTC times" do
      type = Quack::Types::Time.new("2014-03-22T03:00:00-07:00")
      expected = Time.new(2014, 3, 22, 3, 0, 0, "-07:00")
      type.to_coerced.must_equal(expected)
    end

    it "should cast YMD formatted times" do
      type = Quack::Types::Time.new("2014-03-22")
      expected = Time.new(2014, 3, 22, 0, 0, 0, "+00:00")
      type.to_coerced.must_equal(expected)
    end

    it "should raise a ParseError for dates out of range" do
      type = Quack::Types::Time.new("0000-00-00")
      proc { type.to_coerced }.must_raise(Quack::ParseError)
    end

    it "should raise a ParseError for invalid dates" do
      type = Quack::Types::Time.new("foo")
      proc { type.to_coerced }.must_raise(Quack::ParseError)
    end
  end

  describe "#to_s" do
    it "should cast UTC times to ISO 8601 strings" do
      time = Time.utc(2014, 3, 22, 3, 10, 12)
      type = Quack::Types::Time.new(time)
      type.to_s.must_equal("2014-03-22T03:10:12Z")
    end

    it "should cast non-UTC times to ISO 8601 strings" do
      time = Time.new(2014, 3, 22, 3, 10, 12, "-07:00")
      type = Quack::Types::Time.new(time)
      type.to_s.must_equal("2014-03-22T03:10:12-07:00")
    end
  end
end
