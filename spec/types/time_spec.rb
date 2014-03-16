require "test_helper"

describe Quack::Types::Time do
  describe ".matches?" do
    it "should be true for Time objects" do
      Quack::Types::Time.matches?(Time.new(2014, 3, 22)).must_equal(true)
    end

    it "should be true for ISO 8601 UTC times" do
      Quack::Types::Time.matches?("2014-03-22T03:00:00Z").must_equal(true)
    end

    it "should be true for ISO 8601 non-UTC times" do
      Quack::Types::Time.matches?("2014-03-22T03:00:00-08:00").must_equal(true)
    end

    it "should be false for non ISO 8601 dates" do
      Quack::Types::Time.matches?("3/22/2014").must_equal(false)
    end
  end

  describe "#cast" do
    it "should cast ISO 8601 UTC times" do
      type = Quack::Types::Time.new("2014-03-22T03:00:00Z")
      expected = Time.new(2014, 3, 22, 3, 0, 0, "+00:00")
      type.cast.must_equal(expected)
    end

    it "should cast ISO 8601 non-UTC times" do
      type = Quack::Types::Time.new("2014-03-22T03:00:00-07:00")
      expected = Time.new(2014, 3, 22, 3, 0, 0, "-07:00")
      type.cast.must_equal(expected)
    end
  end
end