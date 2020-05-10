class BeerSong
  class DefaultBeers
    def verse(num)
      "#{num} bottles of beer on the wall, #{num} bottles of beer.\n" \
        "Take one down and pass it around, #{num - 1} bottles of beer on the wall.\n"
    end
  end
  
  class TwoBeers
    def verse(num)
      "2 bottles of beer on the wall, 2 bottles of beer.\n" \
      "Take one down and pass it around, 1 bottle of beer on the wall.\n"
    end
  end
  
  class OneBeer
    def verse(num)
      "1 bottle of beer on the wall, 1 bottle of beer.\n" \
      "Take it down and pass it around, no more bottles of beer on the wall.\n"
    end
  end
  
  class NoBeers
    def verse(num)
      "No more bottles of beer on the wall, no more bottles of beer.\n" \
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    end
  end
  
  VERSES = Hash.new(DefaultBeers).merge({
    0 => NoBeers,
    1 => OneBeer,
    2 => TwoBeers
  })

  def verse(num)
    VERSES[num].new.verse(num)
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

# puts BeerSong.new.verse(5)
# puts BeerSong.new.verse(2)
# puts BeerSong.new.verse(1)
# puts BeerSong.new.verse(0)
