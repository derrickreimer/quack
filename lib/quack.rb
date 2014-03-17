require "quack/version"
require "quack/types"
require "quack/guesser"

module Quack
  class ParseError < StandardError; end
end

def Quack(value)
  Quack::Guesser.new(value).guess
end
