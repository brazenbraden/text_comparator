class PercentageComparator

  def compare(tokens1, tokens2)
    combined = (tokens1 + tokens2).uniq
    diff = (tokens1 - tokens2 | tokens2 - tokens1).count
    unique = combined.count - diff

    combined.empty? ? 1.0 : unique.to_f / combined.count.to_f
  end

end