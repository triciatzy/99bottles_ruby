# frozen_string_literal: true

require 'inflector'
require 'byebug'

# Bottles class generates verses for the 99 bottles of beer song
class Bottles
  def initialize; end

  def verse(number)
    verses(number)
  end

  def verses(start, end_num = nil)
    return generate_verse(start) + generate_line2(start - 1) if end_num.nil?

    if start >= end_num
      generate_verse(start) + generate_line2(start - 1) +
        add_new_line(start, end_num) +
        verses(start - 1, end_num)
    else
      ''
    end
  end

  def song
    verses(99, 0)
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

  def add_new_line(start, end_num)
    return "\n" if start > end_num

    ''
  end
end
