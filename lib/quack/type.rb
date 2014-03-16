module Quack
  class Type
    attr_reader :value

    def initialize(value)
      @value = value
    end

    def cast
      raise NotImplementedError
    end
  end
end