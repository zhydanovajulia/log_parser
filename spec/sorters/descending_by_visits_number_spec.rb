# frozen_string_literal: true

require_relative '../../spec/spec_helper'
require_relative '../../sorters/descending_by_visits_number'

describe DescendingByVisitsNumber do
  let(:visits) { { 'page1' => 5, 'page2' => 3, 'page3' => 6 } }

  it 'sorts items in ascending order' do
    expect(described_class.sort(visits)).to eq(['page3', 6, 'page1', 5, 'page2', 3])
  end
end
