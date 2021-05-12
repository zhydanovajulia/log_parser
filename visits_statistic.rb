# frozen_string_literal: true

class VisitStatistic
  attr_reader :ips_per_page

  def initialize
    @ips_per_page = {}
  end

  def collect_visit(page, ip_addr)
    ips_per_page[page] ||= []
    ips_per_page[page] << ip_addr
  end

  def all_visits
    visits_count = {}
    ips_per_page.each do |page, ips|
      visits_count[page] = ips.count
    end
    visits_count
  end

  def uniq_visits
    uniq_visits_count = {}
    ips_per_page.each do |page, ips|
      uniq_visits_count[page] = ips.uniq.count
    end
    uniq_visits_count
  end
end
