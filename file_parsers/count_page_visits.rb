# frozen_string_literal: true

module FileParsers
  class CountPageVisits
    def self.calculate(ips_per_page)
      visits_count = {}
      ips_per_page.each do |page, ips|
        visits_count[page] = ips.count
      end
      visits_count
    end
  end
end
