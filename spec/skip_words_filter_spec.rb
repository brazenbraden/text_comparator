require 'filters/skip_words_filter'

RSpec.describe SkipWordsFilter, 'class' do

  context '#execute' do
    skip_words = ['a', 'and', 'the']

    [
      { input: [], expected: [] },
      { input: ['hello', 'world'], expected: ['hello', 'world'] },
      { input: ['the', 'world'], expected: ['world'] },
      { input: ['and', 'the'], expected: [] }
    ]. each do |example|
      it 'should remove skip words' do
        previous_filter = double('filter')
        allow(previous_filter).to receive(:execute).and_return(example[:input])

        filter = SkipWordsFilter.new(previous_filter, skip_words)
        expect(filter.execute).to eq example[:expected]
      end
    end
  end

end