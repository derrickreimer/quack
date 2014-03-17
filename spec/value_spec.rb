require "test_helper"

describe Quack::Value do
  describe "given a string integer" do
    let(:value) { "123" }
    let(:subject) { Quack::Value.new(value) }
    
    it "should convert to a Fixnum" do
      subject.to_coerced.must_equal(123)
    end

    it "should have Integer type" do
      subject.type_class.must_equal(Quack::Types::Integer)
    end
  end

  describe "given a Fixnum integer" do
    let(:value) { 123 }
    let(:subject) { Quack::Value.new(value) }
    
    it "should return the original value" do
      subject.to_coerced.must_equal(123)
    end

    it "should have Integer type" do
      subject.type_class.must_equal(Quack::Types::Integer)
    end
  end

  describe "given a 'true' string" do
    let(:value) { "true" }
    let(:subject) { Quack::Value.new(value) }
    
    it "should return true" do
      subject.to_coerced.must_equal(true)
    end

    it "should have Boolean type" do
      subject.type_class.must_equal(Quack::Types::Boolean)
    end
  end

  describe "given a 'false' string" do
    let(:value) { "false" }
    let(:subject) { Quack::Value.new(value) }
    
    it "should return false" do
      subject.to_coerced.must_equal(false)
    end

    it "should have Boolean type" do
      subject.type_class.must_equal(Quack::Types::Boolean)
    end
  end

  describe "given true" do
    let(:value) { true }
    let(:subject) { Quack::Value.new(value) }
    
    it "should return true" do
      subject.to_coerced.must_equal(true)
    end

    it "should have Boolean type" do
      subject.type_class.must_equal(Quack::Types::Boolean)
    end
  end

  describe "given false" do
    let(:value) { false }
    let(:subject) { Quack::Value.new(value) }
    
    it "should return false" do
      subject.to_coerced.must_equal(false)
    end

    it "should have Boolean type" do
      subject.type_class.must_equal(Quack::Types::Boolean)
    end
  end

  describe "given an ISO 8061 UTC date" do
    let(:value) { "2014-03-22T03:00:00Z" }
    let(:subject) { Quack::Value.new(value) }
    
    it "should return the correct Time object" do
      expected = Time.utc(2014, 3, 22, 3, 0, 0)
      subject.to_coerced.must_equal(expected)
    end

    it "should have Time type" do
      subject.type_class.must_equal(Quack::Types::Time)
    end
  end

  describe "given an ISO 8061 non-UTC date" do
    let(:value) { "2014-03-22T03:00:00-07:00" }
    let(:subject) { Quack::Value.new(value) }
    
    it "should return the correct Time object" do
      expected = Time.new(2014, 3, 22, 3, 0, 0, "-07:00")
      subject.to_coerced.must_equal(expected)
    end

    it "should have Time type" do
      subject.type_class.must_equal(Quack::Types::Time)
    end
  end

  describe "given an random string" do
    let(:value) { "foo123" }
    let(:subject) { Quack::Value.new(value) }
    
    it "should return the string" do
      subject.to_coerced.must_equal(value)
    end

    it "should have String type" do
      subject.type_class.must_equal(Quack::Types::String)
    end
  end
end