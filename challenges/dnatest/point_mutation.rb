# refractored // further exploration

class DNA
  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(other_strand)
    dna1, dna2 = [@strand, other_strand].sort_by(&:size)
    (0...dna1.size).count { |i| dna1[i] != dna2[i] }
  end
end

# original solution
class DNA
  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(other_strand)
    dna1, dna2 = generate_equal_length(other_strand)
    differences = 0
    dna1.chars.each_with_index do |char, idx|
      differences += 1 if char != dna2[idx]
    end
    differences
  end

  private
  
  attr_reader :strand

  def generate_equal_length(other_strand)
    dna1, dna2 = compare_size(other_strand)
    dna2 = dna2[0, dna1.size]
    [dna1, dna2]
  end

  def compare_size(other_strand)
    strand.size < other_strand.size ? [strand, other_strand] : [other_strand, strand]
  end
end
