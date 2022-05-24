# problem: write a program that takes a string of digits and returns all of the possible consecutive number series of a specified length int hat string
# rules:
# - consecutive numbers 
# - returns a nested array - an array of integers
# - if ask for a series larger than the string, raise an error

# data structures:
# "01234" 
# length: 4

# str[idx, length]
# str[0, 4]
# idx += 1
# str[1, 4]
# idx += 1
# break if idx > str.length - length
# [
#   [0, 1, 2, 3], 
#   [1, 2, 3, 4]
# ]

# initialize/constructor method
# - pass in string as argument
# - assign string to an instance variable

# slices instance method 
# - takes an integer as an argument
# - this integer represents the length of the series
# - raises an ArugmentError if we pass in an integer larger than the length of the string


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
