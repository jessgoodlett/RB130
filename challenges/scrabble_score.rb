# problem: write a program that calculates the score of a scrabble test_empty_word_scores_zero
# rules - 
# AEIOULNRST = 1
# DG = 2
# BCMP = 3
# FHVWY = 4
# K = 5
# JK = 8
# QZ = 10

# The score is calculated by adding the values of all of times used in the word

# CABBAGE
# 3 + 1 + 3 + 3 + 1 + 2 + 1 = 14

# an empty string / "word" returns a score of 0
# whitespace scores a 0
# nil scores a 0
# case insentive

# data structures: 

# constructor method
# - takes an argument that is to represent the word

# score method
# - returns an integer
# - iterate through an array in which each element represents a character of the word
# - if empty string, nil, or whitespace, returns 0
# - else it computes the score of the word

class Scrabble
  POINTS = { 
    'AEIOULNRST' => 1,
    'DG' => 2,
    'BCMP' => 3,
    'FHVWY' => 4,
    'K' => 5,
    'JX' => 8,
    'QZ' => 10
  }

  def initialize(word)
    @word = word ? word.strip : ''
  end

  def score
    word.chars.map do |char|
      key = POINTS.keys.find { |k| k.include?(char.upcase) }
      POINTS[key]
    end.sum
  end

  def self.score(word)
    Scrabble.new(word).score
  end

  private 

  attr_reader :word
end