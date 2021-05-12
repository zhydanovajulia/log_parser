# frozen_string_literal: true

require_relative '../../spec/spec_helper'
require_relative '../../formatters/format_all_visits'

describe FormatAllVisits do
  let(:sorted_visits) { ['page3', 6, 'page1', 5, 'page2', 3] }

  it 'formats array of all visits' do
    expect(described_class.format(sorted_visits)).to eq(['page3 6 visits', 'page1 5 visits', 'page2 3 visits'])
  end
end
