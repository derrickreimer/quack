require "forwardable"

module Quack
  class Value
    extend Forwardable
    attr_reader :value, :type_class, :type_instance
    
    delegate :to_coerced => :type_instance
    delegate :to_s => :type_instance

    def initialize(value)
      @value = value
      @type_class = Quack::Types.select { |t| t.matches?(value) }.first
      @type_instance = type_class.new(value)
    end

    def type_matches?(other)
      type_class == other.type_class
    end
  end
end