require 'analyzers/standard_analyzer'
require 'comparators/percentage_comparator'

class TextComparator

  def compare(text1, text2, synonyms, skip_words)
    analyzer = StandardAnalyzer.new(synonyms, skip_words).analyzer
    tokens1 = analyzer.execute(text1)
    tokens2 = analyzer.execute(text2)

    PercentageComparator.new.compare(tokens1, tokens2)
  end

end