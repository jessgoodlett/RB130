class Triangle
  def initialize(s1, s2, s3)
    @sides = [s1, s2, s3].sort
    raise ArgumentError.new "Invalid triangle sides" unless valid?
  end

  def kind
    case sides.uniq.size
         when 1 then 'equilateral'
         when 2 then 'isosceles'
         else 'scalene'
    end
  end
  
  private

  attr_reader :sides
  
  def valid?
    sides[0, 2].sum > sides[2]
  end
end 