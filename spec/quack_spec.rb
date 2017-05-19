require "test_helper"

describe Quack do
  let(:raw_value) { "123" }
  it "should proxy to the guesser" do
    type = Quack(raw_value)
    type.class.must_equal(Quack::Types::Integer)
    type.to_coerced.must_equal(123)
  end
end
