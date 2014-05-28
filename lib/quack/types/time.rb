require "time"
require "quack/type"

module Quack
  module Types
    class Time < Quack::Type
      YMD_FORMAT = /
        (?<year>\d{4})(-|\/)
        (?<month>\d{2})(-|\/)
        (?<day>\d{2})
      /x

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

        def iso_8601?(value)
          !!(value.to_s =~ ISO_8601)
        end

        def ymd?(value)
          !!(value.to_s =~ YMD_FORMAT)
        end

        def matches?(value)
          already_coerced?(value) || iso_8601?(value) || ymd?(value)
        end
      end

      def iso_8601?
        self.class.iso_8601?(value)
      end

      def ymd?
        self.class.ymd?(value)
      end

      def parse_offset(offset)
        offset == "Z" ? UTC : offset
      end

      def parse_iso8601
        parts = value.to_s.scan(ISO_8601).flatten
        offset = parse_offset(parts.pop)
        parts = parts.map(&:to_i) << offset
        ::Time.new(*parts)
      rescue => ex
        raise ParseError.new(ex.message)
      end

      def parse_ymd
        parts = value.to_s.scan(YMD_FORMAT).flatten
        parts = parts.map(&:to_i) + [0, 0, 0, UTC]
        ::Time.new(*parts)
      rescue => ex
        raise ParseError.new(ex.message)
      end

      def to_coerced
        return value if already_coerced?
        return parse_iso8601 if iso_8601?
        parse_ymd
      end

      def to_s
        to_coerced.iso8601
      end
    end
  end
end