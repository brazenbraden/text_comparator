class SortFilter

  def initialize(filter)
    @analyzer = filter
  end

  def execute(text = '')
    @analyzer.execute(text).sort!
  end

end