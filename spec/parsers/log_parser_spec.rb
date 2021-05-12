# frozen_string_literal: true

require_relative '../../spec/spec_helper'
require_relative '../../parsers/log_parser'

describe LogParser do
  let(:bad_log) { './spec/fixtures/bad_log.log' }
  let(:csv_log) { './spec/fixtures/test_log.csv' }
  let(:statistics_collector) { double('statistics_collector') }

  it 'calls statistic collector' do
    allow(statistics_collector).to receive(:collect_visit)
    expect(statistics_collector).to receive(:collect_visit).exactly(4).times
    described_class.new.collect_ips_per_page(bad_log, statistics_collector)
  end

  it "doesn't parse CSV files" do
    allow(statistics_collector).to receive(:collect_visit)
    expect(statistics_collector).not_to receive(:collect_visit)
    described_class.new.collect_ips_per_page(csv_log, statistics_collector)
  end
end
