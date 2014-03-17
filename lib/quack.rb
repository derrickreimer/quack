require "quack/version"
require "quack/types"
require "quack/guesser"

module Quack
  def self.guess(value)
    Quack::Guesser.new(value).guess  
  end

  class ParseError < StandardError; end
end
