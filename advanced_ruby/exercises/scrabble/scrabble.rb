class Scrabble
  LETTER_VALUES = {
    ['A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T'] => 1,
    ['D', 'G']                                         => 2,
    ['B', 'C', 'M', 'P']                               => 3,
    ['F', 'H', 'V', 'W', 'Y']                          => 4,
    ['K']                                              => 5,
    ['J', 'X']                                         => 8,
    ['Q', 'Z']                                         => 10
  }

  def initialize(string)
    @string = string
  end

  def score
    return 0 if @string.nil?
    
    score = 0
    characters = @string.split('')
    characters.each do |c|
      LETTER_VALUES.each do |key, value|
        score += value if key.include?(c.upcase)
      end
    end
    score
  end

  def self.score(string)
    new(string).score
  end
end