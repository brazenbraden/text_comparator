class SkipWordsFilter

  def initialize(filter, skip_words)
    @analyzer = filter
    @skip_words = skip_words
  end

  def execute(text = '')
    @analyzer.execute(text).reject{ |token| @skip_words.include? token }
  end

end