# # 1

# def sum_of_sums(arr)
#   res = 0
#   index = 0
#   while index < arr.size
#     res += arr[0..index].sum
#     index += 1
#   end
#   # 1.upto(arr.size) instead of while loop
#   res
# end

# p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
# p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
# p sum_of_sums([4]) == 4
# p sum_of_sums([1, 2, 3, 4, 5]) == 35

# # 2

# print "Enter a noun: "
# noun = gets.chomp
# print "Enter a verb: "
# verb = gets.chomp
# print "Enter a adjective: "
# adjective = gets.chomp
# print "Enter a adverb: "
# adverb = gets.chomp

# puts "Do you #{verb} your #{adjective} #{noun} #{adverb}? That's hilarious!"

# # 3

# def substrings_at_start(str)
#   arr = []
#   str.chars.each_with_index {|c, i| arr << str[0..i] }
#   arr
# end

# # p substrings_at_start('abc') == ['a', 'ab', 'abc']
# # p substrings_at_start('a') == ['a']
# # p substrings_at_start('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

# # 4

# def substrings(str)
#   arr = []
#   str.chars.each_index {|i| arr << substrings_at_start(str[i..str.size])}
#   arr.flatten
# end

# p substrings('abcde') == [
#   'a', 'ab', 'abc', 'abcd', 'abcde', 
#   'b', 'bc', 'bcd', 'bcde',
#   'c', 'cd', 'cde',
#   'd', 'de',
#   'e'
# ]

# 5

# def palindromes(str)
#   arr = substrings(str)
#   # arr = substrings(str.delete('^a-zA-Z'))
#   p arr.select {|word| word.reverse == word && word.size >= 2}
# end

# p palindromes('abcd') == []
# p palindromes('madam') == ['madam', 'ada']
# p palindromes('hello-madam-did-madam-goodbye') == [
#   'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
#   'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
#   '-madam-', 'madam', 'ada', 'oo'
# ]
# p palindromes('knitting cassettes') == [
#   'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
# ]

# # 6

# def fizzbuzz(first, last)
#   arr = []
#   (first..last).each do |n|
#     if n % 5 == 0 && n % 3 == 0
#       arr << "FizzBuzz"
#     elsif n % 5 == 0
#       arr << "Buzz"
#     elsif n % 3 ==0
#       arr << "Fizz"
#     else
#       arr << n
#     end
#   end
#   arr.join(', ')
# end

# p fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz

# # 7

# def repeater(str)
#   arr = []
#   str.chars.each {|c| 2.times {|_| arr << c} }
#   arr.join('')
# end

# p repeater('Hello') == "HHeelllloo"
# p repeater("Good job!") == "GGoooodd  jjoobb!!"
# p repeater('') == ''

# 8

# def double_consonants(str)
#   arr = []
#   str.chars.each do |c|
#     arr << c if c.downcase =~ /[bcdfghjklmnpqrstvwxyz]/
#     arr << c
#   end

#   arr.join('')
# end

# p double_consonants('String') == "SSttrrinngg"
# p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
# p double_consonants("July 4th") == "JJullyy 4tthh"
# p double_consonants('') == ""

# # 9

# def reversed_number(int)
#   # res = 0
#   # while int > 0
#   #   remainder = int % 10
#   #   res = res * 10 + remainder
#   #   int /= 10
#   # end
#   # res
#   str = int.to_s
#   reversed = str.reverse
#   reversed.to_i
# end

# p reversed_number(12345) == 54321
# p reversed_number(12213) == 31221
# p reversed_number(456) == 654
# p reversed_number(12000) == 21 # Note that zeros get dropped!
# p reversed_number(1) == 1

# # 10

# def center_of(str)
#   mid = (str.size / 2).floor
#   if str.size.odd?
#     str[mid]
#   else
#     str[mid - 1.. mid]
#   end
# end

# p center_of('I love ruby') == 'e'
# p center_of('Launch School') == ' '
# p center_of('Launch') == 'un'
# p center_of('Launchschool') == 'hs'
# p center_of('x') == 'x'

