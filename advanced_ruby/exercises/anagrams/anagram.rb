class Anagram
  def initialize(keyword)
    @keyword = keyword 
  end

  def match(arr)
    arr.select do |word| 
      word.downcase == @keyword ? false : get_count(word) == get_count(@keyword)
    end.uniq
  end

  def get_count(word)
    letters = {}
    ("a".."z").each { |letter| letters[letter] = 0 }
    word.chars { |c| letters[c.downcase] += 1}
    letters
  end
end

Anagram.new('test')