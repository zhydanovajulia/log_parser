# frozen_string_literal: true

require_relative '../spec/spec_helper'
require_relative '../parse_log'

describe ParseLog do
  let(:good_log) { './spec/fixtures/test_log.log' }
  let(:good_csv) { './spec/fixtures/test_log.csv' }
  let(:empty_log) { './spec/fixtures/empty_log.log' }
  let(:unknown_log) { './spec/fixtures/unknown.qwe' }
  let(:nonexistent_log) { 'nonexistent.log' }

  it 'parses .log file' do
    expect(described_class.new([good_log]).parse).to eq(['/contact 2 visits', '/about/2 2 visits',
                                                         '/index 1 visits', '/help_page/1 1 visits',
                                                         '/contact 2 unique views', '/index 1 unique views',
                                                         '/help_page/1 1 unique views', '/about/2 1 unique views'])
  end

  it 'parses .csv file' do
    expect(described_class.new([good_csv]).parse).to eq(['/contact 2 visits', '/about/2 2 visits',
                                                         '/index 1 visits', '/help_page/1 1 visits',
                                                         '/contact 2 unique views', '/index 1 unique views',
                                                         '/help_page/1 1 unique views', '/about/2 1 unique views'])
  end
end
