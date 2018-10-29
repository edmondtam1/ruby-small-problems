# # 1

# def repeat(str, num)
#   num.times {|_| puts str}
# end

# repeat('hello', 3)

# # 2

# def is_odd?(num)
#   num % 2 == 1
# end

# p is_odd?(-17)

# # 3

# def digit_list(num)
#   num.digits.reverse
# end

# puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
# puts digit_list(7) == [7]                     # => true
# puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
# puts digit_list(444) == [4, 4, 4]             # => true

# # 4

# vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck', 'motorcycle', 'motorcycle', 'car', 'truck']

# def count_occurrences(arr)
#   hsh = {}
#   arr.each do |word|
#     hsh[word] += 1 if hsh[word]
#     hsh[word] = 1 if !hsh[word]
#   end
#   hsh.each do |k, v|
#     puts "#{k} => #{v}"
#   end
# end

# count_occurrences(vehicles)

# # 5

# def reverse_sentence(str)
#   str.split(" ").reverse.join(" ")
# end

# puts reverse_sentence('') == ''
# puts reverse_sentence('Hello World') == 'World Hello'
# puts reverse_sentence('Reverse these words') == 'words these Reverse'

# # 6

# def reverse_words(str)
#   arr = str.split(" ")
#   arr.each do |word|
#     if word.size >= 5
#       word.reverse!
#     else
#       next
#     end
#   end
#   arr.join(' ')
# end

# puts reverse_words('Professional')          # => lanoisseforP
# puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
# puts reverse_words('Launch School')         # => hcnuaL loohcS

# 7

# def stringy(num, first = 1)
#   # result = ''
#   # if num % 2 == 0
#   #   (num / 2).times {|_| result += '10'}
#   # else
#   #   (num / 2).times {|_| result += '10'}
#   #   result += '1'
#   # end
#   # result

#   result = []
#   num.times do |i|
#     if first == 1
#       number = i.even? ? '1' : '0'
#     else
#       number = i.even? ? '0' : '1'
#     end
#     result << number
#   end
#   result.join

# end

# puts stringy(6) == '101010'
# puts stringy(9) == '101010101'
# puts stringy(4) == '1010'
# puts stringy(7) == '1010101'
# puts stringy(5, 0) == '01010'

# # 8

# def average(arr)
#   # arr.sum / arr.size
#   sum = arr.reduce(:+).to_f
#   sum / arr.count.to_f
# end

# puts average([1, 5, 87, 45, 8, 8]) # == 25.0
# puts average([9, 47, 23, 95, 16, 52]) # == 40.0

# # 9

# def sum(num)
#   num.to_s.split('').map(&:to_i).sum
# end

# puts sum(23) == 5
# puts sum(496) == 19
# puts sum(123_456_789) == 45

# 10

def calculate_bonus(num, bool)
  bool ? num / 2 : 0
end


puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000
