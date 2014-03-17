require "quack/types/integer"
require "quack/types/boolean"
require "quack/types/time"
require "quack/types/string"

module Quack
  module Types
    extend Enumerable

    TYPES = [
      Quack::Types::Integer,
      Quack::Types::Boolean,
      Quack::Types::Time
    ]

    def self.each
      TYPES.each { |t| yield(t) }
    end
  end
end