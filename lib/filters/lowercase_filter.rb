class LowercaseFilter

  def initialize(filter)
    @analyzer = filter
  end

  def execute(text = '')
    @analyzer.execute(text).map(&:downcase)
  end

end