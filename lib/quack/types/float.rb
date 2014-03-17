require "quack/type"

module Quack
  module Types
    class Float < Quack::Type
      PATTERN = /\A\d+\.\d*\z/

      class << self
        def built_in_types
          [::Float]
        end

        def matches?(value)
          already_coerced?(value) || !!(value.to_s.strip =~ PATTERN)
        end
      end

      def to_coerced
        already_coerced? ? value : value.to_f
      end
    end
  end
end