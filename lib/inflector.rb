# frozen_string_literal: true

module Inflector
  class << self
    def pluralize(n, singular, plural = nil)
      if n == 1
        "1 #{singular}"
      elsif n.zero?
        "no more #{plural || "#{singular}s"}"
      elsif plural
        "#{n} #{plural}"
      else
        "#{n} #{singular}s"
      end
    end
  end
end
