require "quack/type"

module Quack
  module Types
    class Float < Quack::Type
      PATTERN = /\A\d+\.\d*\z/

      class << self
        def built_in_types
          [::Float]
        end

        def already_coerced?(value)
          built_in_types.include?(value.class)
        end

        def matches?(value)
          already_coerced?(value) || !!(value.to_s.strip =~ PATTERN)
        end
      end

      def already_coerced?
        self.class.already_coerced?(value)
      end

      def to_coerced
        return value if already_coerced?
        value.to_f
      end
    end
  end
end