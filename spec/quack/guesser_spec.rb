require "test_helper"

describe Quack::Guesser do
  describe "given a string integer" do
    let(:raw_value) { "123" }
    let(:subject) { Quack::Guesser.new(raw_value) }

    it "should have Integer type" do
      subject.guess.class.must_equal(Quack::Types::Integer)
    end
  end

  describe "given a Fixnum integer" do
    let(:raw_value) { 123 }
    let(:subject) { Quack::Guesser.new(raw_value) }

    it "should have Integer type" do
      subject.guess.class.must_equal(Quack::Types::Integer)
    end
  end

  describe "given a string float" do
    let(:raw_value) { "123.4" }
    let(:subject) { Quack::Guesser.new(raw_value) }

    it "should have Float type" do
      subject.guess.class.must_equal(Quack::Types::Float)
    end
  end

  describe "given a Float" do
    let(:raw_value) { 123.4 }
    let(:subject) { Quack::Guesser.new(raw_value) }

    it "should have Float type" do
      subject.guess.class.must_equal(Quack::Types::Float)
    end
  end

  describe "given a 'true' string" do
    let(:raw_value) { "true" }
    let(:subject) { Quack::Guesser.new(raw_value) }

    it "should have Boolean type" do
      subject.guess.class.must_equal(Quack::Types::Boolean)
    end
  end

  describe "given a 'false' string" do
    let(:raw_value) { "false" }
    let(:subject) { Quack::Guesser.new(raw_value) }

    it "should have Boolean type" do
      subject.guess.class.must_equal(Quack::Types::Boolean)
    end
  end

  describe "given true" do
    let(:raw_value) { true }
    let(:subject) { Quack::Guesser.new(raw_value) }

    it "should have Boolean type" do
      subject.guess.class.must_equal(Quack::Types::Boolean)
    end
  end

  describe "given false" do
    let(:raw_value) { false }
    let(:subject) { Quack::Guesser.new(raw_value) }

    it "should have Boolean type" do
      subject.guess.class.must_equal(Quack::Types::Boolean)
    end
  end

  describe "given an ISO 8061 UTC date" do
    let(:raw_value) { "2014-03-22T03:00:00Z" }
    let(:subject) { Quack::Guesser.new(raw_value) }

    it "should have Time type" do
      subject.guess.class.must_equal(Quack::Types::Time)
    end
  end

  describe "given a padded ISO 8061 UTC date" do
    let(:raw_value) { "     2014-03-22T03:00:00Z " }
    let(:subject) { Quack::Guesser.new(raw_value) }

    it "should have Time type" do
      subject.guess.class.must_equal(Quack::Types::Time)
    end
  end

  describe "given an embedded ISO 8061 UTC date" do
    let(:raw_value) { "something awesome will happen 2014-03-22T03:00:00Z or thereabouts" }
    let(:subject) { Quack::Guesser.new(raw_value) }

    it "should have String type" do
      subject.guess.class.must_equal(Quack::Types::String)
    end
  end

  describe "given an embedded simple date" do
    let(:raw_value) { "something awesome will happen 2014-03-22 or thereabouts" }
    let(:subject) { Quack::Guesser.new(raw_value) }

    it "should have String type" do
      subject.guess.class.must_equal(Quack::Types::String)
    end
  end

  describe "given an ISO 8061 non-UTC date" do
    let(:raw_value) { "2014-03-22T03:00:00-07:00" }
    let(:subject) { Quack::Guesser.new(raw_value) }

    it "should have Time type" do
      subject.guess.class.must_equal(Quack::Types::Time)
    end
  end

  describe "given an random string" do
    let(:raw_value) { "foo123" }
    let(:subject) { Quack::Guesser.new(raw_value) }

    it "should have String type" do
      subject.guess.class.must_equal(Quack::Types::String)
    end
  end
end
