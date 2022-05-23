class SumOfMultiples
  def initialize(*multiples)
    @multiples = multiples
  end

  def self.to(num)
    SumOfMultiples.new(3, 5).to(num)
  end

  def to(num)
    multiples.flat_map do |mult|
      (0...num).to_a.select { |n| n % mult == 0 }
    end.uniq.sum
  end

  private

  attr_reader :multiples
end

