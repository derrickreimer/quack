require "quack/type"

module Quack
  module Types
    class String < Quack::Type
      class << self
        def matches?(value)
          true
        end
      end

      def to_coerced
        value.to_s
      end
    end
  end
end