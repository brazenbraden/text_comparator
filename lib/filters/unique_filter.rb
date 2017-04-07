class UniqueFilter

  def initialize(filter)
    @analyzer = filter
  end

  def execute(text = '')
    @analyzer.execute(text).uniq
  end

end