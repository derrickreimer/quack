require "quack/types/integer"
require "quack/types/boolean"
require "quack/types/time"

module Quack
  module Types
    extend Enumerable

    TYPES = {
      "integer" => Quack::Types::Integer,
      "boolean" => Quack::Types::Boolean,
      "time" => Quack::Types::Time
    }

    def self.each
      TYPES.values.each { |t| yield(t) }
    end
  end
end