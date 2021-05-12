# frozen_string_literal: true

class LogParser
  def collect_ips_per_page(filename, statistics_collector)
    File.foreach(filename) do |row|
      page, ip_addr = row.split(' ')
      next unless ip_addr

      statistics_collector.collect_visit(page, ip_addr)
    end
  end
end
