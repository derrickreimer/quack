require "quack/type"

module Quack
  module Types
    class Null < Quack::Type
      class << self
        def matches?(value)
          value.nil?
        end
      end

      def to_coerced
        nil
      end
    end
  end
end