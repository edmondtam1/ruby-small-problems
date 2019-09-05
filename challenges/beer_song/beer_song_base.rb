class BeerSong
  def verse(num)
    return false unless num.integer?
    phrase = case num
    when 3..100
      "#{num} bottles of beer on the wall, #{num} bottles of beer.\n" \
      "Take one down and pass it around, #{num - 1} bottles of beer on the wall.\n"
    when 2
      "2 bottles of beer on the wall, 2 bottles of beer.\n" \
      "Take one down and pass it around, 1 bottle of beer on the wall.\n"
    when 1
      "1 bottle of beer on the wall, 1 bottle of beer.\n" \
      "Take it down and pass it around, no more bottles of beer on the wall.\n"
    when 0
      "No more bottles of beer on the wall, no more bottles of beer.\n" \
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    end
  end

  def verses(first, last)
    result = ""
    while first >= last
      result += verse(first)
      result += "\n" unless first == last
      first -= 1
    end
    result
  end

  def lyrics
    verses(99, 0)
  end

end
