# frozen_string_literal: true

class FormatUniqVisits
  def self.format(items)
    formatted = []
    items.each_slice(2) do |key, value|
      formatted << "#{key} #{value} unique views"
    end
    formatted
  end
end
