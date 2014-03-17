require "test_helper"

describe Quack do
  describe ".guess" do
    let(:value) { "123" }
    it "should proxy to the guesser" do
      type = Quack.guess(value)
      type.class.must_equal(Quack::Types::Integer)
      type.to_coerced.must_equal(123)
    end
  end
end