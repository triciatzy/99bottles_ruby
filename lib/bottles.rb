# frozen_string_literal: true

require 'inflector'
class Bottles
  def initialize; end

  def verse(number)
    "#{Inflector.pluralize(number, 'bottle')} of beer on the wall, #{Inflector.pluralize(number, 'bottle')} of beer.\n"\
    "Take one down and pass it around, #{Inflector.pluralize(number - 1, 'bottle')} of beer on the wall.\n"
  end
end
