module Quack
  class Value
    attr_reader :original_value

    def initialize(original_value)
      @original_value = original_value
    end
  end
end