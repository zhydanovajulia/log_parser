# frozen_string_literal: true

require './sorters/no_sort'
require './formatters/no_format'

class LogFile
  def initialize(filename:, parser:, statistic:)
    @statistics_collector = statistic
    parser.collect_ips_per_page(filename, statistics_collector)
  end

  def all_visits(sorter: NoSort, formatter: NoFormat)
    result = statistics_collector.all_visits
    result = sorter.sort(result)
    formatter.format(result)
  end

  def uniq_visits(sorter: NoSort, formatter: NoFormat)
    result = statistics_collector.uniq_visits
    result = sorter.sort(result)
    formatter.format(result)
  end

  private

  attr_reader :statistics_collector
end
