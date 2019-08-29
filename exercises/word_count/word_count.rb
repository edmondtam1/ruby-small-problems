class Phrase
  def initialize(phrase)
    @phrase = phrase
  end

  def word_count
    count = Hash.new(0)
    @phrase.scan(/[a-z]+'?[a-z]+|\d+/) { |word| count[word.downcase] += 1}
    count
  end
end