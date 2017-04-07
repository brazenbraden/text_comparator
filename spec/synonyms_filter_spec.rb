require 'filters/synonyms_filter'

RSpec.describe SynonymsFilter, 'class' do

  context '#execute' do
    synonyms = {'nav' => 'navigation'}

    [
      { input: [], expected: [] },
      { input: ['nav', 'world'], expected: ['navigation', 'world'] },
    ]. each do |example|
      it 'should convert synonyms' do
        previous_filter = double('filter')
        allow(previous_filter).to receive(:execute).and_return(example[:input])

        filter = SynonymsFilter.new(previous_filter, synonyms)
        expect(filter.execute).to eq example[:expected]
      end
    end
  end

end