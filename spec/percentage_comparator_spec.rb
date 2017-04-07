require 'comparators/percentage_comparator'

describe 'PercentageComparator' do

  context '#compare' do
    comparator = PercentageComparator.new
    [
      { tokens1: [], tokens2: [], expected: 1.0 },
      { tokens1: ['a'], tokens2: ['a'], expected: 1.0 },
      { tokens1: ['a'], tokens2: [], expected: 0.0 },
      { tokens1: [], tokens2: ['a'], expected: 0.0 },
      { tokens1: ['a', 'b'], tokens2: ['a'], expected: 0.5 },
      { tokens1: ['a', 'b', 'c', 'd'], tokens2: ['a'], expected: 0.25 },
      { tokens1: ['a'], tokens2: ['b'], expected: 0.0 }
    ].each do |example|
      it 'should return a per centage similarity for two token arrays' do
        expect(comparator.compare(example[:tokens1], example[:tokens2])).to eq example[:expected]
      end
    end

  end

end