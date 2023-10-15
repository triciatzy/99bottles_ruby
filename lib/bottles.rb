# frozen_string_literal: true

require 'inflector'
require 'byebug'
class Bottles
  def initialize; end

  def verse(number)
    verses(number)
  end

  def verses(*numbers)
    return '' if numbers.empty?

    number = numbers.first
    generate_verse(number) + generate_line2(number - 1) + add_new_line(numbers) + verses(*numbers[1..])
  end

  private

  def generate_verse(number)
    case number
    when 0
      "No more bottles of beer on the wall, no more bottles of beer.\n"
    else
      "#{Inflector.pluralize(number, 'bottle')} of beer on the wall, "\
      "#{Inflector.pluralize(number, 'bottle')} of beer.\n"
    end
  end

  def generate_line2(number)
    case number
    when negative
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    when 0
      'Take it down and pass it around, ' \
        "no more bottles of beer on the wall.\n"
    else
      "Take one down and pass it around, #{Inflector.pluralize(number, 'bottle')} of beer on the wall.\n"
    end
  end

  def negative
    proc(&:negative?)
  end

  def add_new_line(number_of_elements)
    return "\n" if number_of_elements.count > 1

    ''
  end
end
