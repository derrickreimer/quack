module Quack
  class Guesser
    attr_reader :value

    def initialize(value)
      @value = value
    end

    def guess
      klass.new(value)
    end

  private

    def klass
      Quack::Types.select { |t| 
        t.matches?(value) 
      }.first
    end
  end
end