# frozen_string_literal: true

require_relative '../spec/spec_helper'
require_relative '../parser_selector'

describe ParserSelector do
  let(:good_log) { './spec/fixtures/test_log.log' }
  let(:good_csv) { './spec/fixtures/test_log.csv' }
  let(:empty_log) { './spec/fixtures/empty_log.log' }
  let(:unknown_log) { './spec/fixtures/unknown.qwe' }
  let(:nonexistent_log) { 'nonexistent.log' }

  it 'returns LogParser parser if no error' do
    expect(described_class.select_parser(good_log)).to eq([LogParser, nil])
  end

  it 'returns CsvParser parser if no error' do
    expect(described_class.select_parser(good_csv)).to eq([CsvParser, nil])
  end

  it 'returns UnknownParser if file extension is not supported' do
    expect(described_class.select_parser(unknown_log)).to eq([UnknownParser, "Don't know how to parse this file."])
  end

  it 'returns UnknownParser if file is empty' do
    expect(described_class.select_parser(empty_log)).to eq([UnknownParser, 'The file is empty.'])
  end

  it 'returns UnknownParser if file is not provided' do
    expect(described_class.select_parser(nil)).to eq([UnknownParser, 'Enter file name.'])
  end

  it 'returns UnknownParser if file does not exist' do
    expect(described_class.select_parser(nonexistent_log)).to eq([UnknownParser, 'The file does not exist.'])
  end
end
