# # 1

# def greetings(arr, hsh)
#   combined = hsh[:title] + ' ' + hsh[:occupation]
#   puts "Hello, #{arr.join(' ')}! Nice to have a #{combined} around."
# end

# greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
# # => Hello, John Q Doe! Nice to have a Master Plumber around.

# # 2

# def twice(int)
#   str = int.to_s
#   return 2*int if str.size == 1
#   mid = str.size / 2
#   left_str = str.size.zero? ? '' : str[0..mid - 1]
#   right_str = str[mid..-1]
#   return int if left_str == right_str
#   return 2*int
# end

# p twice(37) == 74
# p twice(44) == 44
# p twice(334433) == 668866
# p twice(444) == 888
# p twice(107) == 214
# p twice(103103) == 103103
# p twice(3333) == 3333
# p twice(7676) == 7676
# p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
# p twice(5) == 10

# # 3

# def negative(int)
#   -int.abs
# end

# p negative(5) == -5
# p negative(-3) == -3
# p negative(0) == 0 

# # 4

# def sequence(int)
#   int > 0 ? (1..int).to_a : int.abs.times.map {|i| -(i+1)}
# end

# p sequence(5) == [1, 2, 3, 4, 5]
# p sequence(3) == [1, 2, 3]
# p sequence(1) == [1]
# p sequence(-6)

# # 5 - might be overreliant on loops

# def uppercase?(str)
#   str.chars.each do |c|
#     return false if c.downcase =~ /[a-z]/ && c =~ /[^A-Z]/
#   end
#   true
#   # str.upcase == str
# end


# p uppercase?('t') == false
# p uppercase?('T') == true
# p uppercase?('Four Score') == false
# p uppercase?('FOUR SCORE') == true
# p uppercase?('4SCORE!') == true
# p uppercase?('') == true

# # 6

# def word_lengths(str)
#   str.split(' ').map do |word|
#     word + ' ' + word.size.to_s
#   end
# end

# p word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]

# p word_lengths("baseball hot dogs and apple pie") ==
#   ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

# p word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

# p word_lengths("Supercalifragilisticexpialidocious") ==
#   ["Supercalifragilisticexpialidocious 34"]

# p word_lengths("") == []

# # 7

# def swap_name(str)
#   arr = str.split
#   arr[1] + ', ' + arr[0]
# end

# p swap_name('Joe Roberts') == 'Roberts, Joe'

# # 8

# def sequence(count, num)
#   arr = []
#   count.times {|i| arr << num * (i + 1)}
#   arr
# end

# p sequence(5, 1) == [1, 2, 3, 4, 5]
# p sequence(4, -7) == [-7, -14, -21, -28]
# p sequence(3, 0) == [0, 0, 0]
# p sequence(0, 1000000) == []

# # 9

# def get_grade(int1, int2, int3)
#   sum = int1 + int2 + int3
#   ave = sum / 3
#   # case
#   # when 90 <= ave && 100 >= ave then return "A"
#   # when 80 <= ave && 90 > ave then return "B"
#   # when 70 <= ave && 80 > ave then return "C"
#   # when 60 <= ave && 70 > ave then return "D"
#   # when 0 <= ave && 60 > ave then return "F"
#   # end
#   case ave
#   when 90..100 then 'A'
#   when 80..89 then 'B'
#   when 70..79 then 'C'
#   when 60..69 then 'D'
#   when 0..59 then 'F'
#   end
# end

# p get_grade(95, 90, 93) == "A"
# p get_grade(50, 50, 95) == "D"

# # 10

# def buy_fruit(arr)
#   result = []
#   arr.each do |sub|
#     sub[1].times {|_| result << sub[0]}
#   end
#   result
# end

# p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
#   ["apples", "apples", "apples", "orange", "bananas","bananas"]


