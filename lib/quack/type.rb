module Quack
  class Type
    attr_reader :value

    def initialize(value)
      @value = value
    end

    def to_coerced
      raise NotImplementedError
    end

    def to_s
      to_coerced.to_s
    end
  end
end