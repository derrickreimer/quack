module Quack
  class Value
    attr_reader :value, :type_class, :type_instance

    def initialize(value)
      @value = value
      guess_type
    end

    def guess_type
      @type_class = Quack::Types.select { |t| t.matches?(value) }.first
      @type_class ||= Quack::Types::String
      @type_instance = type_class.new(value)
    end

    def to_coerced
      type_instance.to_coerced
    end

    def to_s
      type_instance.to_s
    end

    def type_matches?(other)
      type_class == other.type_class
    end

    def ==(other)
      if type_matches?(other)
        to_coerced == other.to_coerced
      else
        to_s == other.to_s
      end
    end

    def <(other)
      if type_matches?(other)
        to_coerced < other.to_coerced
      else
        to_s < other.to_s
      end
    end

    def >(other)
      if type_matches?(other)
        to_coerced > other.to_coerced
      else
        to_s > other.to_s
      end
    end

    def <=(other)
      if type_matches?(other)
        to_coerced <= other.to_coerced
      else
        to_s <= other.to_s
      end
    end

    def >=(other)
      if type_matches?(other)
        to_coerced >= other.to_coerced
      else
        to_s >= other.to_s
      end
    end
  end
end