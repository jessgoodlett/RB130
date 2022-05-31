class CustomSet
  def initialize(set=[])
    @set = set.uniq
  end

  def empty?
    set.empty?
  end

  def contains?(el)
    set.include?(el)
  end

  def subset?(other)
    return true if self.empty? && other.empty?
    subsets = []
    size = set.size
    idx = 0
    until idx > size
      subsets << other.set[idx, size]
      idx += 1
    end
    subsets.include?(set)
  end

  def disjoint?(other)
    other.set.all? { |el| !contains?(el) }
  end

  def eql?(other)
    return false unless set.length == other.set.length
    set.all? { |el| other.contains?(el) }
  end

  def ==(other)
    eql?(other)
  end

  def add(el)
    set << el unless contains?(el)
    self
  end

  def intersection(other)
    results = []
    set.each { |el| results << el if other.contains?(el) }
    CustomSet.new(results)
  end

  def difference(other)
    results = []
    set.dup.each { |el| results << el unless other.contains?(el) }
    CustomSet.new(results)
  end

  def union(other)
    results = []
    set.each  { |el| results << el unless results.include?(el) }
    other.set.each  { |el| results << el unless results.include?(el) }
    CustomSet.new(results)
  end

  protected

  attr_reader :set
end
