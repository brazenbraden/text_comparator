require 'analyzers/standard_analyzer'

describe 'StandardAnalyzer' do

  context '#execute' do
    it 'should return analyzed and filtered tokens' do
      text = 'the hi world'
      synonyms = {'hi' => 'hello'}
      skip_words = ['the']

      analyzer = StandardAnalyzer.new(synonyms, skip_words).analyzer
      expect(analyzer.execute(text)).to eq ['hello', 'world']
    end
  end

end