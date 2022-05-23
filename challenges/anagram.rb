class Anagram
  def initialize(word)
    @word = word
  end

  def match(list_of_words)
    original = @word.downcase
    list_of_words.select do |w|
      original.chars.sort == w.downcase.chars.sort && 
        original != w.downcase
    end
  end
end