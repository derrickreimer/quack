module Quack
  class Type
    attr_reader :value

    def initialize(value)
      @value = value
    end

    class << self
      def built_in_types
        []
      end

      def already_coerced?(value)
        built_in_types.include?(value.class)
      end
    end

    def already_coerced?
      self.class.already_coerced?(value)
    end

    def to_coerced
      raise NotImplementedError
    end

    def type_matches?(other)
      self.class == other.class
    end

    def to_s
      to_coerced.to_s
    end
  end
end