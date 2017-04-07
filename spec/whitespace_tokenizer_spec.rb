require 'tokenizers/whitespace_tokenizer'

RSpec.describe WhitespaceTokenizer, 'class' do
  tokenizer = WhitespaceTokenizer.new

  context '#execute' do
    [
      { input: '', expected: [] },
      { input: 'hello world', expected: ['hello', 'world'] },
      { input: 'hello   world', expected: ['hello', 'world'] },
      { input: "hello\nworld", expected: ['hello', 'world'] },
      { input: "hello\tworld", expected: ['hello', 'world'] },
      { input: "hello\rworld", expected: ['hello', 'world'] },
      { input: "hello\vworld", expected: ['hello', 'world'] },
      { input: "hello\fworld", expected: ['hello', 'world'] }
    ].each do |example|
      it 'should split a string into an array of word tokens' do
        expect(tokenizer.execute(example[:input])).to eq example[:expected]
      end
    end

  end

end
