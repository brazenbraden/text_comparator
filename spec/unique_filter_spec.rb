require 'filters/unique_filter'

RSpec.describe UniqueFilter, 'class' do

  context '#execute' do
    [
      { input: [], expected: [] },
      { input: ['a', 'b'], expected: ['a', 'b'] },
      { input: ['a', 'b', 'a'], expected: ['a', 'b'] },
      { input: ['a', 'a', 'b', 'a'], expected: ['a', 'b'] }
    ].each do |example|
      it 'should remove duplicate tokens' do
        previous_filter = double('filter')
        allow(previous_filter).to receive(:execute).and_return(example[:input])

        filter = UniqueFilter.new(previous_filter)
        expect(filter.execute).to eq example[:expected]
      end
    end

  end

end