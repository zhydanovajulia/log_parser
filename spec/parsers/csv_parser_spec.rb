# frozen_string_literal: true

require_relative '../../spec/spec_helper'
require_relative '../../parsers/csv_parser'

describe CsvParser do
  let(:bad_csv) { './spec/fixtures/bad_log.csv' }
  let(:log_file) { './spec/fixtures/test_log.log' }
  let(:statistics_collector) { double('statistics_collector') }

  it 'calls statistic collector' do
    allow(statistics_collector).to receive(:collect_visit)
    expect(statistics_collector).to receive(:collect_visit).exactly(4).times
    described_class.new.collect_ips_per_page(bad_csv, statistics_collector)
  end

  it "doesn't parse .log files" do
    allow(statistics_collector).to receive(:collect_visit)
    expect(statistics_collector).not_to receive(:collect_visit)
    described_class.new.collect_ips_per_page(log_file, statistics_collector)
  end
end
