# frozen_string_literal: true

class DescendingByVisitsNumber
  def self.sort(visits)
    visits.sort_by { |_, v| -v }.flatten
  end
end
