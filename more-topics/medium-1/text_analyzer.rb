# Text Analyzer

# The trickiest part of getting this one working was the File I/O.
# Beyond that, we're just yielding text to a block.

class TextAnalyzer
  def initialize(filename)
    @filename = filename
    @path = File.join(__dir__, @filename)
  end

  def process
    file = File.open(@path)
    content = file.read
    yield content
    file.close
  end
end

analyzer = TextAnalyzer.new('sample_txt.txt')
analyzer.process do |text|
  paragraphs = text.split("\n\n")
  puts "#{paragraphs.size} paragraphs"
end
analyzer.process do |text|
  lines = text.split("\n")
  puts "#{lines.size} lines"
end
analyzer.process do |text|
  words = text.split()
  puts "#{words.size} words"
end
