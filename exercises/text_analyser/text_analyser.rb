

class TextAnalyzer
  def process
    file = File.open("test_text.txt", "r")
    yield(file.read)
    file.close    
  end
end

analyzer = TextAnalyzer.new
analyzer.process do |text|
  puts "Number of paragraphs: #{text.split("\n\n").count}"
end
analyzer.process do |text|
  puts "Number of lines: #{text.split("\n").count}"
end
analyzer.process do |text|
  puts "Number of sentences: #{text.split(".").count}"
end
analyzer.process do |text|
  puts "Number of words: #{text.split(" ").count}"
end