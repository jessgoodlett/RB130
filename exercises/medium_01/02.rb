class TextAnalyzer
  def process
    file = File.open('sample.txt', 'r')
    yield(file.read)
    file.close
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |text| puts "#{text.split("\n\n").count} paragraphs" } # paragraph count
analyzer.process { |text| puts "#{text.split("\n").count} lines" } # line count
analyzer.process { |text| puts "#{text.split.count} words" } # word count