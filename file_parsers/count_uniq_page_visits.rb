# frozen_string_literal: true

module FileParsers
  class CountUniqPageVisits
    def self.calculate(ips_per_page)
      uniq_visits_count = {}
      ips_per_page.each do |page, ips|
        uniq_visits_count[page] = ips.uniq.count
      end
      uniq_visits_count
    end
  end
end
