# frozen_string_literal: true

require_relative '../../spec/spec_helper'
require_relative '../../formatters/format_uniq_visits'

describe FormatUniqVisits do
  let(:sorted_visits) { ['page3', 6, 'page1', 5, 'page2', 3] }

  it 'formats array of all visits' do
    expect(described_class.format(sorted_visits)).to eq(['page3 6 unique views', 'page1 5 unique views',
                                                         'page2 3 unique views'])
  end
end
