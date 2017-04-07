require 'text_comparator'

describe 'TextComparator' do

  context '#compare' do
    synonyms = {'hi' => 'hello'}
    skip_words = ['the']
    text_comparator = TextComparator.new
    [
      { text1: '', text2: '', expected: 1.0 },
      { text1: 'hello', text2: 'world', expected: 0.0 },
      { text1: 'hello', text2: 'hi world', expected: 0.5 },
      { text1: 'hello', text2: 'hi the world', expected: 0.5 }
    ].each do |example|
      it 'should return percentage  similarity from two token arrays' do
        expect(text_comparator.compare(example[:text1], example[:text2], synonyms, skip_words)).to eq example[:expected]
      end
    end

  end

end