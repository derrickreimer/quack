require "quack/type"

module Quack
  module Types
    class Integer < Quack::Type
      PATTERN = /\A\d+\z/

      class << self
        def matches?(value)
          !!(value.to_s.strip =~ PATTERN)
        end
      end

      def cast
        value.to_i
      end
    end
  end
end