class PhoneNumber
  def initialize(num)
    @num = num
  end

  def number
    result = @num.scan(/\d+/).join('').scan(/\A([1]?)(\d{10})\z/)
    result == [] || !!@num.match(/[a-zA-Z]+/) ? '0000000000' : result[0][1]
  end

  def to_s
    num = number
    "(" + num[0..2] + ") " + num[3..5] + "-" + num[6..9]
  end

  def area_code
    number[0..2]
  end
end
