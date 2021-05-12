# frozen_string_literal: true

require_relative '../spec/spec_helper'
require_relative '../visits_statistic'

describe VisitStatistic do
  let(:page) { 'page' }
  let(:ip) { '1.1.1.1' }

  it '#collect_visit' do
    statistic = described_class.new
    statistic.collect_visit(page, ip)
    expect(statistic.ips_per_page).to eq({ page => [ip] })
  end

  it '#all_visits' do
    ip1 = '2.2.2.2'
    statistic = described_class.new
    statistic.collect_visit(page, ip)
    statistic.collect_visit(page, ip1)
    expect(statistic.all_visits).to eq({ page => 2 })
  end

  it '#uniq_visits' do
    ip1 = '1.1.1.1'
    statistic = described_class.new
    statistic.collect_visit(page, ip)
    statistic.collect_visit(page, ip1)
    expect(statistic.uniq_visits).to eq({ page => 1 })
  end
end
