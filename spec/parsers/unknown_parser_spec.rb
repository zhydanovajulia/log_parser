# frozen_string_literal: true

require_relative '../../spec/spec_helper'
require_relative '../../parsers/unknown_parser'

describe UnknownParser do
  let(:csv_log) { './spec/fixtures/test_log.csv' }
  let(:log_file) { './spec/fixtures/test_log.log' }
  let(:statistics_collector) { double('statistics_collector') }

  it "doesn't parse files" do
    allow(statistics_collector).to receive(:collect_visit)
    expect(statistics_collector).not_to receive(:collect_visit)
    described_class.new.collect_ips_per_page(csv_log, statistics_collector)
    described_class.new.collect_ips_per_page(log_file, statistics_collector)
  end
end
