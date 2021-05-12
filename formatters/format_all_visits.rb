# frozen_string_literal: true

class FormatAllVisits
  def self.format(items)
    formatted = []
    items.each_slice(2) do |key, value|
      formatted << "#{key} #{value} visits"
    end
    formatted
  end
end
