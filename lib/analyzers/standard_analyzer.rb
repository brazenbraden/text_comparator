require 'tokenizers/whitespace_tokenizer'
require 'filters/lowercase_filter'
require 'filters/synonyms_filter'
require 'filters/skip_words_filter'
require 'filters/unique_filter'
require 'filters/sort_filter'

class StandardAnalyzer

  def initialize(synonyms, skip_words)
    @synonyms = synonyms
    @skip_words = skip_words

    filter = WhitespaceTokenizer.new
    filter = LowercaseFilter.new(filter)
    filter = SynonymsFilter.new(filter, @synonyms)
    filter = SkipWordsFilter.new(filter, @skip_words)
    filter = UniqueFilter.new(filter)
    filter = SortFilter.new(filter)

    @analyzer = filter
  end

  def analyzer
    @analyzer
  end

end