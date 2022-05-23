class Octal
  def initialize(oct)
    @oct = oct.match?(/[^0-7]/) ? 0 : oct
  end

  def to_decimal
    oct.to_i.digits.map.with_index { |n, i| 8**i * n }.sum
  end

  private

  attr_reader :oct
end