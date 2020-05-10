# # 2

# BLOCKS = %w(BO XK DQ CP NA GT RE FS JW HU VI LY ZM).freeze

# def block_word?(str)
#   up_str = str.upcase
#   BLOCKS.each do |block|
#     return false if up_str.count(block) >= 2
#   end
#   true
# end

# p block_word?('BATCH') == true
# p block_word?('BUTCH') == false
# p block_word?('jest') == true

# # 3

# def letter_percentages(str)
#   hsh = {lowercase: 0, uppercase: 0, neither: 0}
#   str.chars.each do |c|
#     hsh[:lowercase] += 1 if c =~ /[a-z]/
#     hsh[:uppercase] += 1 if c =~ /[A-Z]/
#     hsh[:neither] += 1 if c =~ /[^a-zA-Z]/
#   end
#   total = str.length.to_f
#   hsh1 = {lowercase: hsh[:lowercase].fdiv(total) * 100,
#           uppercase: hsh[:uppercase] * 100 / total,
#           neither: hsh[:neither] * 100 / total,}
#   p hsh1
# end

# p letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
# p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
# p letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }

# # 4

# def balanced?(str)
#   counter = 0
#   str.chars.each do |c|
#     counter += 1 if c =~ /\(|{|\[/
#     counter -= 1 if c =~ /\)|}|\]/
#     return false if counter < 0
#   end
#   counter.zero?
# end

# p balanced?('What (is) this?') == true
# p balanced?('What is) this?') == false
# p balanced?('What (is this?') == false
# p balanced?('((What) (is this))?') == true
# p balanced?('((What)) (is this))?') == false
# p balanced?('Hey!') == true
# p balanced?(')Hey!(') == false
# p balanced?('What ((is))) up(') == false
# p balanced?('hi {} []') == true

# # 5

# def triangle(s1, s2, s3)
#   arr = [s1, s2, s3]
#   sum = arr.sum
#   max_side = [s1, s2, s3].max
#   smaller_sides = sum - max_side
#   return :invalid if smaller_sides < max_side || arr.min <= 0
#   return :equilateral if s1 == s2 && s2 == s3
#   return :isosceles if s1 == s2 || s2 == s3 || s3 == s1
#   :scalene
# end


# p triangle(3, 3, 3) == :equilateral
# p triangle(3, 3, 1.5) == :isosceles
# p triangle(3, 4, 5) == :scalene
# p triangle(0, 3, 3) == :invalid
# p triangle(3, 1, 1) == :invalid

# # 6

# def triangle(a1, a2, a3)
#   arr = [a1, a2, a3]
#   # return :invalid if arr.sum != 180 || arr.min <= 0
#   # return :right if arr.select {|i| i == 90}.size > 0
#   # return :acute if arr.select {|i| i < 90}.size == 3
#   # return :obtuse if arr.select {|i| i > 90}.size > 0

#   case
#   when arr.sum != 180 || arr.min <= 0
#     :invalid
#   when arr.include?(90)
#     :right
#   when arr.all? {|a| a < 90}
#     :acute
#   else
#     :obtuse
#   end
# end

# p triangle(60, 70, 50) == :acute
# p triangle(30, 90, 60) == :right
# p triangle(120, 50, 10) == :obtuse
# p triangle(0, 90, 90) == :invalid
# p triangle(50, 50, 50) == :invalid

# # 7

# def friday_13th(year)
#   count = 0
#   1.upto(12) do |month|
#     count += 1 if Time.new(year, month, 13).friday?
#   end
#   count
# end

# p friday_13th(2015) == 3
# p friday_13th(1986) == 1
# p friday_13th(2019) == 2

# # 8

# INTEGERS = %w(0 1 2 3 4 5 6 7 8 9)

# def featured(int)
#   next_one = int + 1
#   loop do
#     return next_one if featured_check(next_one)
#     return 'Error!' if next_one >= 9_876_543_210
#     next_one += 1
#   end
#   p next_one
# end

# def featured_check(int)
#   int % 2 == 1 && int % 7 == 0 && int.digits.uniq == int.digits
# end


# p featured(12) == 21
# p featured(20) == 21
# p featured(21) == 35
# p featured(997) == 1029
# p featured(1029) == 1043
# p featured(999_999) == 1_023_547
# p featured(999_999_987) == 1_023_456_987

# p featured(9_999_999_999) # -> There is no possible number that fulfills those requirements

# # 9

# def bubble_sort!(arr)
#   n = arr.size
#   while n > 1
#     newn = 0
#     1.upto(n - 1) do |idx|
#       next if arr[idx - 1] <= arr[idx]
#       arr[idx - 1], arr[idx] = arr[idx], arr[idx-1]
#       newn = idx
#     end
#     n = newn
#   end
#   nil
#   # not sure why this sorted?(arr) didn't work
#   # while !sorted?(arr)
#   #   arr.each_cons(2) do |a, b|
#   #     a, b = b, a if a > b
#   #   end
#   # end
#   # arr
# end

# # def sorted?(arr)
# #   arr.each_cons(2).all? do |a, b|
# #     (a <=> b) <= 0
# #   end
# # end

# array = [5, 3]
# bubble_sort!(array)
# p array == [3, 5]

# array = [6, 2, 7, 1, 4]
# bubble_sort!(array)
# p array == [1, 2, 4, 6, 7]

# array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
# bubble_sort!(array)
# p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)

# # 10

# def sum_square_difference(int)
#   first_part = 1.upto(int).reduce(:+)**2
#   second_part = 1.upto(int).inject {|sum, n| sum + n**2}
#   p first_part - second_part
# end

# p sum_square_difference(3) == 22
#    # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
# p sum_square_difference(10) == 2640
# p sum_square_difference(1) == 0
# p sum_square_difference(100) == 25164150


