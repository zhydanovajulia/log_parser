#!/usr/bin/env ruby
# frozen_string_literal: true

require './parser_selector'
require './log_file'
require './visits_statistic'
require './sorters/descending_by_visits_number'
require './formatters/format_all_visits'
require './formatters/format_uniq_visits'

class ParseLog
  def initialize(args)
    @file_path = args[0]
  end

  def parse
    parser, error = ParserSelector.select_parser(file_path)
    log_error(error)

    log = LogFile.new(filename: file_path, parser: parser.new, statistic: VisitStatistic.new)

    [log.all_visits(sorter: DescendingByVisitsNumber, formatter: FormatAllVisits),
     log.uniq_visits(sorter: DescendingByVisitsNumber, formatter: FormatUniqVisits)].flatten
  end

  private

  def log_error(error)
    p error if error
  end

  attr_reader :file_path
end

p ParseLog.new(ARGV).parse if $PROGRAM_NAME == __FILE__
