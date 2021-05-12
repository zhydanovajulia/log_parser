# frozen_string_literal: true

require './parsers/unknown_parser'
require './parsers/log_parser'
require './parsers/csv_parser'

class ParserSelector
  EXTENSIONS = { ".log": LogParser, ".csv": CsvParser }.freeze

  def self.select_parser(filename)
    return [UnknownParser, 'Enter file name.'] unless filename
    return [UnknownParser, 'The file does not exist.'] unless File.exist?(filename)

    parser = EXTENSIONS[File.extname(filename).to_sym]

    return [UnknownParser, "Don't know how to parse this file."] unless parser
    return [UnknownParser, 'The file is empty.'] unless File.size?(filename)

    [parser, nil]
  end
end
