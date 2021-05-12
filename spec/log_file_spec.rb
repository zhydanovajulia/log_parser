# frozen_string_literal: true

require_relative '../spec/spec_helper'
require_relative '../log_file'

describe LogFile do
  let(:test_log) { 'test_log' }
  let(:parser) { double('parser') }
  let(:statistics_collector) { double('statistics_collector') }
  subject { described_class.new(filename: test_log, parser: parser, statistic: statistics_collector) }

  it 'responds to all_visits' do
    allow(parser).to receive(:collect_ips_per_page)
    expect(statistics_collector).to receive(:all_visits).once
    subject.all_visits
  end

  it 'responds to uniq_visits' do
    allow(parser).to receive(:collect_ips_per_page)
    expect(statistics_collector).to receive(:uniq_visits).once
    subject.uniq_visits
  end
end
