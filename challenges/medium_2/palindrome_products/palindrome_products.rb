class Palindromes
  def initialize(max_factor:, min_factor: 1)
    @factors = [min_factor, max_factor]
    @palindromes = Hash.new([])
  end

  def generate
    @factors[0].upto(@factors[1]) do |i|
      i.upto(@factors[1]) do |j|
        @palindromes[i * j] += [[i, j]] if is_palindrome?(i * j)
      end
    end
  end

  def largest
    value = @palindromes.keys.max
    Palindrome.new(value, @palindromes[value])
  end

  def smallest
    value = @palindromes.keys.min
    Palindrome.new(value, @palindromes[value])
  end

  def is_palindrome?(num)
    num.to_s.reverse == num.to_s
  end
end

class Palindrome
  attr_reader :value, :factors
  
  def initialize(value, factors)
    @value, @factors = value, factors
  end
end
