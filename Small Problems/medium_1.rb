# # 1

# def rotate_array(arr)
#   new_arr = arr[1..-1]
#   new_arr << arr[0]
#   new_arr
#   # arr[1..-1] + arr[0]
# end

# def rotate_str(str)
#   rotate_array(str.chars).join
# end

# def rotate_int(int)
#   rotate_str(int.to_s).to_i
# end

# p rotate_str('asdf')
# p rotate_int(345)

# p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
# p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
# p rotate_array(['a']) == ['a']

# x = [1, 2, 3, 4]
# p rotate_array(x) == [2, 3, 4, 1]   # => true
# p x == [1, 2, 3, 4]                 # => true

# # 2

# def rotate_rightmost_digits(int, count)
#   result = int.to_s
#   return rotate_str(result[-count..-1]).to_i if count == result.size
#   str = result[0..result.size - count - 1] + rotate_str(result[-count..-1])
#   str.to_i
# end

# p rotate_rightmost_digits(735291, 1) == 735291
# p rotate_rightmost_digits(735291, 2) == 735219
# p rotate_rightmost_digits(735291, 3) == 735912
# p rotate_rightmost_digits(735291, 4) == 732915
# p rotate_rightmost_digits(735291, 5) == 752913
# p rotate_rightmost_digits(735291, 6) == 352917

# 3

# def max_rotation(int)
#   index = int.digits.size
#   result = int
#   while index > 0 
#     result = rotate_rightmost_digits(result, index)
#     index -= 1
#   end
#   result
# end

# p max_rotation(735291) == 321579
# p max_rotation(3) == 3
# p max_rotation(35) == 53
# p max_rotation(105) == 15 # the leading zero gets dropped
# p max_rotation(8_703_529_146) == 7_321_609_845

# # 4

# require 'pry'

# def thousand_lights(int)
#   arr = [*(1..int)]
#   puts "Round 1: every light is turned on "
#   (int - 1).times do |n|
#     arr.each_index do |i|
#       if arr[i] && (arr[i] % (n + 2) == 0)
#         arr[i] = nil
#       elsif arr[i] == nil && (i + 1) % (n + 2) == 0
#         arr[i] = i + 1
#       else
#         next
#       end
#     end
#     on = arr.select {|n| n }
#     off = []
#     arr.each_with_index {|num, idx| off << idx + 1 if !num }
#     puts "Round #{n+2}: lights #{off.join(', ')} are now off; #{on.join(', ')} are on."
#   end
#   arr.select {|n| n }
# end

# p thousand_lights(5)
# p thousand_lights(10)
# p thousand_lights(50)

# # 5

# def diamond1(int)
#   return false if int.even?
#   stars = 1
#   spaces = (int / 2.0).floor
  
#   (int / 2.0).floor.times do
#     puts ' ' * spaces + '*' * stars
#     stars += 2
#     spaces -= 1
#   end

#   puts '*' * int

#   (int / 2.0).floor.times do
#     spaces += 1
#     stars -= 2
#     puts ' ' * spaces + '*' * stars
#   end  
# end

# def print_row(grid_size, distance_from_center)
#   if (grid_size - 1)/2 == distance_from_center
#     puts "*".center(grid_size)
#   else
#     spacing = (grid_size - distance_from_center * 2 - 2)
#     puts " " * distance_from_center + "*" + " " * spacing + "*"
    
#   end
# end

# def diamond(grid_size)
#   distance_from_center = (grid_size - 1)/2
#   distance_from_center.downto(0) {|d| print_row(grid_size, d)}
#   1.upto(distance_from_center) {|d| print_row(grid_size, d)}
# end

# diamond(3)
# diamond(5)
# diamond(9)

# # 6

# def do_command(command, register, num)
#   case command
#   when "ADD" then register + num
#   when "SUB" then register - num
#   when "MULT" then register * num
#   when "DIV" then register / num
#   when "MOD" then register % num
#   when "POP" then num
#   else nil
#   end
# end

# def minilang(str)
#   stack = []
#   register = 0
#   commands = str.split(' ')
#   while commands.size > 0
#     command = commands.shift
#     if command.to_i.to_s == command
#       register = command.to_i
#     elsif command == "PUSH"
#       stack.push(register)
#     elsif command == "PRINT"
#       puts register
#     else
#       num = stack.pop.to_i
#       register = do_command(command, register, num)
#       break if register == nil
#     end
#   end
#   if register == nil
#     p "Invalid tokens!"
#   else
#     nil
#   end
# end

# # # minilang('5 PRINT PUSH PRINT')
# # minilang('PRINT')
# # # 0

# # minilang('5 PUSH 3 MULT PRINT')
# # # 15

# # minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# # # 5
# # # 3
# # # 8

# # minilang('5 PUSH POP PRINT')
# # # 5

# # minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# # # 5
# # # 10
# # # 4
# # # 7

# # minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# # # 6

# # minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# # # 12

# # minilang('-3 PUSH 5 SUB PRINT')
# # # 8

# # minilang('6 PUSH')
# # # (nothing printed; no PRINT commands)

# # minilang('4 PUSH 5 MULT PUSH PRINT 3 PUSH -7 ADD PRINT ADD PRINT 3 PUSH PRINT 5 MOD PRINT')
# minilang('3 PUSH 5 MOD PUSH 3 PUSH 7 PUSH 4 PUSH 5 MULT SUB ADD DIV PRINT C')

# 7

# second attempt based on suggested solution

NUMBERS = ['zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine'].freeze

def word_to_digit1(str)
  NUMBERS.each_index do |i|
    str1 = str.downcase
    str1.gsub!(/\b#{NUMBERS[i]}\b/, i.to_s)
  end
  str
end

# third attempt which builds on my first attempt and Amanda Sutter's response

def integer?(str)
  str.to_i.to_s == str || str.to_s.to_i == str
end

def word_to_digit(str)
  str.split(/\b/).map {|i| NUMBERS.include?(i) ? NUMBERS.index(i) : i}.join('')
end

def remove_spaces(str)
  arr1 = []
  arr2 = word_to_digit(str).split(' ')
  arr2.each_index do |i|
    integer?(arr2[i-1]) ? arr1[-1] += arr2[i] : arr1 << arr2[i]
  end
  arr1.join(' ')
end

require 'pry'

def format_phone(str)
  arr1 = []
  arr2 = remove_spaces(str).split(/\b/)
  p arr2
  num = ''
  arr2.each_index do |i|
    integer?(arr2[i]) ? num += arr2[i] : arr1 << arr2[i]
    if num.size == 10
      arr1 << "(" + num[0..2] + ") " + num[3..5] + "-" + num[6..9]
      num = ''
    end
  end
  arr1.join('')
end

# DIGIT_HASH = {
#   'zero' => '0', 'one' => '1', 'two' => '2', 'three' => '3', 'four' => '4',
#   'five' => '5', 'six' => '6', 'seven' => '7', 'eight' => '8', 'nine' => '9'
# }.freeze

# def word_to_digit(words)
#   DIGIT_HASH.keys.each do |word|
#     words.gsub!(/\b#{word}\b/, DIGIT_HASH[word])
#   end
#   words
# end

p word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'
p remove_spaces('Please call me at five five five one two three four. Thanks.')
p format_phone('Please call me at five five five one two three four two two zero. Thanks.')

# medium_1: 8

def fibonacci1(int)
  return 1 if int <= 2
  fibonacci1(int - 1) + fibonacci1(int - 2)
end

# def fibonacci(int)
#   return 1 if int <= 2
#   n1 = 1
#   n2 = 1
#   fib = 0
#   (int-2).times do
#     fib = n1 + n2
#     n2 = n1
#     n1 = fib
#   end
#   fib
# end

def fibonacci(int)
  first, last = [1, 1]
  3.upto(int) do
    first, last = [last, first + last]
  end
  last
end

p fibonacci(1) == 1
p fibonacci(2) == 1
p fibonacci(3) == 2
p fibonacci(4) == 3
p fibonacci(5) == 5
p fibonacci(12) == 144
p fibonacci(20) == 6765

def fibonacci_last1(int)
  fibonacci(int) % 10
end

def fibonacci_last(int)
  first, last = [1, 1]
  3.upto(int) do
    first, last = [last % 10, (first + last) % 10]
  end
  last
end

p fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
p fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
p fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
p fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
p fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
p fibonacci_last(123456789) # -> 4
