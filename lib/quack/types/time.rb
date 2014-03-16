require "quack/type"

module Quack
  module Types
    class Time < Quack::Type
      ISO_8601 = /
        (?<year>\d{4})-
        (?<month>\d{2})-
        (?<day>\d{2})T
        (?<hour>\d{2}):
        (?<minute>\d{2}):
        (?<second>\d{2})
        (?<offset>Z|(\+|-)(\d{2}):(\d{2}))
      /x

      UTC = "+00:00"

      class << self
        def built_in_types
          [::Time]
        end

        def matches?(value)
          built_in_types.include?(value.class) || 
            !!(value.to_s =~ ISO_8601)
        end
      end

      def already_cast?
        self.class.built_in_types.include?(value.class)
      end

      def cast
        return value if already_cast?
        match = value.to_s.match(ISO_8601)
        offset = match[:offset] == "Z" ? UTC : match[:offset]

        ::Time.new(
          match[:year].to_i,
          match[:month].to_i,
          match[:day].to_i,
          match[:hour].to_i,
          match[:minute].to_i,
          match[:second].to_i,
          offset
        )
      end
    end
  end
end