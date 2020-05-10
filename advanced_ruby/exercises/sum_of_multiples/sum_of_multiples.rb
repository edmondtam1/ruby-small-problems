class SumOfMultiples
  def self.to(limit, multiples = [3, 5])
    (0...limit).select do |num|
      multiples.any? {|mult| num % mult == 0 }
    end.reduce(:+)
    # @multiples = [3, 5]
    # sum = 0
    # 1.upto(num - 1) do |i|
    #   sum += i unless valid(i)
    # end
    # sum
  end

  def initialize(*multiples)
    @multiples = multiples
  end

  def to(limit)
    # sum = 0
    # 1.upto(num - 1) do |i|
    #   sum += i unless valid(i)
    # end
    # sum

    self.class.to(limit, @multiples)
  end

  # def self.valid(i)
  #   @multiples.each do |mult|
  #     return false if i % mult == 0
  #   end
  #   true
  # end
end