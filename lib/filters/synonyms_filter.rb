class SynonymsFilter

  def initialize(filter, synonyms)
    @analyzer = filter
    @synonyms = synonyms
  end

  def execute(text = '')
    @analyzer.execute(text).map do |token|
      @synonyms.has_key?(token) ? @synonyms[token] : token
    end
  end

end