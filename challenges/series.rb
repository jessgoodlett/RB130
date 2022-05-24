class Series
  attr_reader :digits

  def initialize(digits)
    @digits = digits
  end

  def slices(series)
    raise ArgumentError.new if series > digits.size
    length = series
    idx = 0
    results = []
    until idx > digits.size - length
      results << digits.chars[idx, length].map(&:to_i)
      idx += 1
    end
    results
  end
end
