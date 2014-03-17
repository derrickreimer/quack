require "quack/type"

module Quack
  module Types
    class Integer < Quack::Type
      PATTERN = /\A\d+\z/

      class << self
        def built_in_types
          [::Fixnum]
        end

        def matches?(value)
          already_coerced?(value) || !!(value.to_s.strip =~ PATTERN)
        end
      end

      def to_coerced
        already_coerced? ? value : value.to_i
      end
    end
  end
end