require "quack/types/null"
require "quack/types/integer"
require "quack/types/float"
require "quack/types/boolean"
require "quack/types/time"
require "quack/types/string"

module Quack
  module Types
    extend Enumerable

    TYPES = [
      Quack::Types::Null,
      Quack::Types::Integer,
      Quack::Types::Float,
      Quack::Types::Boolean,
      Quack::Types::Time,
      # ... insert new types here ...
      Quack::Types::String # must be last!
    ]

    def self.each
      TYPES.each { |t| yield(t) }
    end
  end
end