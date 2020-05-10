# # 1

# NUMBERS = ["1st", "2nd", "3rd", "4th", "5th"]
# result = []

# NUMBERS.each do |n|
# puts "Enter the #{n} number:"
# ans = gets.chomp.to_i
# result << ans
# end

# puts "Enter the last number:"
# last = gets.chomp.to_i

# answer = result.select do |n|
# n == last
# end

# if answer.size == 0
# puts "Not!"
# else
# puts "Found!"
# end

# # 2

# puts "==> Enter the first number:"
# first = gets.chomp.to_i

# puts "==> Enter the second number:"
# second = gets.chomp.to_i

# add = first + second
# sub = first - second
# mult = first * second
# divi = first * second
# modu = first % second
# power = first ** second

# puts "==> #{first} + #{second} = #{add}"
# puts "==> #{first} - #{second} = #{sub}"
# puts "==> #{first} * #{second} = #{mult}"
# puts "==> #{first} / #{second} = #{divi}"
# puts "==> #{first} % #{second} = #{modu}"
# puts "==> #{first} ** #{second} = #{power}"

# # 3



# print "Please write word or multiple words: "
# phrase = gets.chomp
# counter = 0

# phrase.chars.each do |n|
#   counter += 1 if n.match?(/[^ ]/)
# end

# p counter


# # 4

# def multiply(n1, n2)
#   n1 * n2
# end

# p multiply(4, 20)


# # 5

# def square(n)
#   multiply(n, n)
# end

# def square(n, power)
#   result = 1
#   power.times {|_| result = multiply(result, n) }
#   result
# end

# # 6

# def xor?(bool1, bool2)
#   bool1 && !bool2 || bool2 && !bool1
# end


# # 7

# def oddities(arr)
#   array = []
#   arr.each_with_index do |n, i|
#     array << n if i.even? # i.odd?
#   end
#   array
# end

# # can be done with select, loop methods

# # 8* difficult - initially tried to split string into two halves, but faced even/odd sized strings

def palindrome?(str)
  return false if str.empty?
  str == str.reverse
end

# def a_pal?(arr)
#   arr == arr.reverse
# end

# p palindrome?('madam') #== true
# p palindrome?('Madam') #== false          # (case matters)
# p palindrome?("madam i'm adam") #== false # (all characters matter)
# p palindrome?('356653') #== true
# p a_pal?(['3', 'b', '3'])
# p palindrome?(['3', 'b', '3'])
# p palindrome?('')

# # 9

# def real_palindrome?(str)
#   str = str.downcase.delete('^a-z0-9')
#   palindrome?(str)
# end

# p real_palindrome?('madam') == true
# p real_palindrome?('Madam') == true           # (case does not matter)
# p real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
# p real_palindrome?('356653') == true
# p real_palindrome?('356a653') == true
# p real_palindrome?('123ab321') == false

# # 10

# def palindromic_number?(int)
#   int.to_s.chars == int.to_s.chars.reverse
# end

# p palindromic_number?(34543) == true
# p palindromic_number?(00001273210) == false
# p palindromic_number?(22) == true
# p palindromic_number?(5) == true
