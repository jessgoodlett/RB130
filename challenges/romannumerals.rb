class RomanNumeral
  ROMAN_NUMERALS = { 
    1000 => 'M',
    900 => 'CM',
    500 => 'D',
    400 => 'CD',
    100 => 'C',
    90 => 'XC',
    50 => 'L',
    40 => 'XL',
    10 => 'X',
    9 => 'IX',
    5 => 'V',
    4 => 'IV',
    1 => 'I'
  }

  def initialize(number)
    @number = number
  end

  def to_roman
    n = @number
    roman = ''
    ROMAN_NUMERALS.each do  |num, value|
      roman << value * (n / num)
      n = n % num
    end
    roman
  end
end