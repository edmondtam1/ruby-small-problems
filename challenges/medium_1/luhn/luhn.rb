class Luhn
  def initialize(num)
    raise ArgumentError unless num.instance_of?(Integer)
    @num = num
  end

  def addends
    addend = @num.to_s.chars.map(&:to_i)
    remainder = addend.size % 2
    addend.map.with_index do |n, i|
      if i % 2 == remainder && n * 2 >= 10
        n * 2 - 9
      elsif i % 2 == remainder && n * 2 < 10
        n * 2
      else
        n
      end
    end
  end

  def checksum
    addends.sum
  end

  def valid?
    checksum % 10 == 0
  end

  def self.create(num)
    value = new(num * 10).checksum
    last_digit = value % 10 == 0 ? 0 : 10 - value % 10
    num * 10 + last_digit
  end
end

print Luhn.new(837_263_756).checksum
print Luhn.new(837_263_7564).checksum
