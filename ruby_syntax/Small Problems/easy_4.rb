# # 1 - can be refactored

# def short_long_short(str1, str2)
#   if str1.size < str2.size
#     short = str1
#     long = str2
#   else
#     short = str2
#     long = str1
#   end
#   short + long + short
# end

# p short_long_short('abc', 'defgh') == "abcdefghabc"
# p short_long_short('abcde', 'fgh') == "fghabcdefgh"
# p short_long_short('', 'xyz') == "xyz"

# # 2 - can break this up into 2 methods, 1 for n and one for suffix

# def century(int)
#   cent = (int - 1) / 100 + 1
#   if cent % 10 == 1
#     return cent.to_s + 'th' if cent.to_s.split('')[-2..-1] == ['1', '1']
#     return cent.to_s + 'st'
#   elsif cent % 10 == 2
#     return cent.to_s + 'th' if cent.to_s.split('')[-2..-1] == ['1', '2']
#     return cent.to_s + 'nd'
#   elsif cent % 10 == 3
#     return cent.to_s + 'th' if cent.to_s.split('')[-2..-1] == ['1', '3']
#     return cent.to_s + 'rd'
#   else
#     return cent.to_s + 'th'
#   end
# end


# p century(1999) == '20th'
# p century(2000) == '20th'
# p century(2001) == '21st'
# p century(1965) == '20th'
# p century(256) == '3rd'
# p century(5) == '1st'
# p century(10103) == '102nd'
# p century(1052) == '11th'
# p century(1127) == '12th'
# p century(11201) == '113th'
# p century(11001) == '111th'
# p century(1001) == '11th'
# p century(3001) == '31st'

# 3 and 4

# def leap_year?(year)
#   return true if year % 4 == 0 && year <= 1752

#   if year % 400 == 0
#     true
#   elsif year % 100 == 0
#     false
#   elsif year % 4 == 0
#     true
#   else
#     false
#   end
# end

# def leap_year_2?(year)
#   if year % 4 == 0
#     if year % 100 == 0
#       if year % 400 == 0
#         true
#       else
#         false
#       end
#     else
#       true
#     end
#   else
#     false
#   end
# end


# p leap_year?(2016) == true
# p leap_year?(2015) == false
# p leap_year?(2100) == false
# p leap_year?(2400) == true
# p leap_year?(240000) == true
# p leap_year?(240001) == false
# p leap_year?(2000) == true
# p leap_year?(1900) == false
# p leap_year?(1752) == true
# p leap_year?(1700) == true
# p leap_year?(1) == false
# p leap_year?(100) == true
# p leap_year?(400) == true

# # 5

# def multisum(n)
#   # result = 0
#   # 1.upto(n) {|m| result += m if m % 3 == 0 || m % 5 == 0 }
#   1.upto(n).select {|m| m % 3 == 0 || m % 5 ==0 }.reduce(0, :+) # copied from other students
#   # result
# end

# p multisum(3) == 3
# p multisum(5) == 8
# p multisum(10) == 33
# p multisum(1000) == 234168

# # 6

# def running_total1(arr)
#   sum = 0
#   arr.map do |n| 
#     sum += n
#   end
# end

# def running_total(arr)
#   sum = 0
#   # arr.each_with_object([]) {|i, a| a << sum += i }.sum
#   arr.reduce([]) {|sum_array, n| sum_array.push(sum += n) }
# end

# p running_total([2, 5, 13]) == [2, 7, 20]
# p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
# p running_total([3]) == [3]
# p running_total([]) == []

# # 7

MAPPING = {'1' => 1,
  '2' => 2,
  '3' => 3,
  '4' => 4,
  '5' => 5,
  '6' => 6,
  '7' => 7,
  '8' => 8,
  '9' => 9,
  '0' => 0,
  'a' => 10,
  'b' => 11,
  'c' => 12,
  'd' => 13,
  'e' => 14,
  'f' => 15}

# def string_to_integer(str)
#   int = 0
#   digits = 1
#   arr = str.chars
#   while arr.size != 0
#     int += MAPPING[arr.pop] * digits
#     digits *= 10
#   end
#   int
# end

# def hexadecimal_to_integer(str)
#   arr = str.downcase.chars.map {|n| MAPPING[n]}

#   value = 0
#   arr.each {|n| value = value * 16 + n }
#   value
# end

# p string_to_integer('4321') == 4321
# p string_to_integer('570') == 570
# p hexadecimal_to_integer('4D9f') == 19871

# # 8

# def string_to_signed_integer(str)
#   # if str[0] == '-'
#   #   -1 * string_to_integer(str[1..-1])
#   # elsif str[0] == '+'
#   #   string_to_integer(str[1..-1])
#   # else
#   #   string_to_integer(str[0..-1])
#   # end

#   digits = (str[0] == '+' || str[0] == '-') ? str[1..-1] : str
#   number = string_to_integer(digits)
#   str[0] == '-' ? -number : number
# end

# p string_to_signed_integer('4321') == 4321
# p string_to_signed_integer('-570') == -570
# p string_to_signed_integer('+100') == 100

# 9

require 'pry'

INT_MAPPING = {1 => '1',
  2 => '2',
  3 => '3',
  4 => '4',
  5 => '5',
  6 => '6',
  7 => '7',
  8 => '8',
  9 => '9',
  0 => '0',
  'a' => '10',
  'b' => '11',
  'c' => '12',
  'd' => '13',
  'e' => '14',
  'f' => '15'}

def integer_to_string(int)
  return '0' if int == 0
  str = ''
  while int > 0
    last = int % 10
    str = INT_MAPPING[last] + str
    int /= 10
  end
  str
end

# p integer_to_string(4321) == '4321'
# p integer_to_string(0) == '0'
# p integer_to_string(5000) == '5000'

# 10

def signed_integer_to_string(int)
  return '0' if int == 0
  sign = int < 0 ? '-' : '+'
  sign + integer_to_string(int.abs)
  # int < 0 ? "-" + integer_to_string(-int) : "+" + integer_to_string(int)
end

p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'

