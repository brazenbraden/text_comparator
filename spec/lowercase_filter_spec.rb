require 'spec_helper'
require 'filters/lowercase_filter'

RSpec.describe LowercaseFilter, 'class' do
  context '#execute' do
    [
      { input: [], expected: []},
      { input: ['hello', 'world'], expected: ['hello', 'world']},
      { input: ['HELLO', 'WORLD'], expected: ['hello', 'world']},
      { input: ['H3Ll0', 'w0rLD!'], expected: ['h3ll0', 'w0rld!']},
    ].each do |example|
      it 'should lowercase array of token words' do
        previous_filter = double('filter')
        allow(previous_filter).to receive(:execute).and_return(example[:input])

        filter = LowercaseFilter.new(previous_filter)
        expect(filter.execute).to eq example[:expected]
      end
    end

  end

end