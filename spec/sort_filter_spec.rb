require 'filters/sort_filter'

RSpec.describe SortFilter, 'class' do

  context '#execute' do
    [
      { input: [], expected: [] },
      { input: ['a', 'b'], expected: ['a', 'b'] },
      { input: ['b', 'a'], expected: ['a', 'b'] },
      { input: ['2', '1'], expected: ['1', '2'] },
      { input: ['appl3', 'an1mal'], expected: ['an1mal', 'appl3'] }
    ].each do |example|
      it 'should sort the array of tokens' do
        previous_filter = double('filter')
        allow(previous_filter).to receive(:execute).and_return(example[:input])

        filter = SortFilter.new(previous_filter)
        expect(filter.execute).to eq example[:expected]
      end
    end
  end

end