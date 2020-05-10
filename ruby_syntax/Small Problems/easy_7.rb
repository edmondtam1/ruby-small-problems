# # 1

# def interleave1(arr1, arr2)
#   arr3 = []
#   index = 0
#   while index < arr1.size
#     arr3 << arr1[index]
#     arr3 << arr2[index]
#     index += 1
#   end
#   arr3
# end

# def interleave(arr1, arr2)
#   arr1.zip(arr2).flatten
# end

# p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']

# # 2

# def letter_case_count(str)
#   hsh = {lowercase: 0, uppercase: 0, neither: 0}
#   str.chars.each do |c|
#     if c =~ /[a-z]/
#       hsh[:lowercase] += 1
#     elsif c =~ /[A-Z]/
#       hsh[:uppercase] += 1
#     else
#       hsh[:neither] += 1
#     end
#   end
#   hsh
# end

# p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
# p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
# p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
# p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }

# # 3

# def word_cap(str)
#   # arr = str.split(' ').map {|word| word[0].upcase + word[1..-1].downcase }
#   arr = str.split(' ').map {|word| word[0].gsub(/[a-z]/) {|c| c.upcase} + word[1..-1].downcase }
#   arr.join(' ')
#   # str.split(' ').map(&:capitalize).join(' ')
# end

# p word_cap('four score and seven') == 'Four Score And Seven'
# p word_cap('the javaScript language') == 'The Javascript Language'
# p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

# # 4

# def swapcase(str)
#   arr = str.split('').map do |c|
#     if c =~ /[a-z]/
#       c.upcase
#     elsif c =~ /[A-Z]/
#       c.downcase
#     else
#       c
#     end
#   end
#   arr.join('')
# end

# p swapcase('CamelCase') == 'cAMELcASE'
# p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'

# # 5

# def staggered_case(str, upcase_first = true, ignore_nonalphabet = false)
#   # ans = ''
#   # str.split('').each_with_index do |c, i|
#   #   if upcase_first
#   #     i.even? ? ans << c.upcase : ans << c.downcase
#   #   else
#   #     i.odd? ? ans << c.upcase : ans << c.downcase
#   #   end
#   # end
#   # ans
#   case_switcher = !upcase_first
#   str.chars.map do |c|
#     if ignore_nonalphabet
#       case_switcher = c.match(/[a-zA-Z]/) ? case_switcher = !case_switcher : case_switcher
#     else
#       case_switcher = !case_switcher
#     end
#     case_switcher ? c.upcase : c.downcase
#   end.join
# end

# # p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
# # p staggered_case('ALL_CAPS') == 'AlL_CaPs'
# # p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

# p staggered_case('I Love Launch School!', true, true) == 'I lOvE lAuNcH sChOoL!'
# p staggered_case('ALL CAPS', true, true) == 'AlL cApS'
# p staggered_case('ignore 77 the 444 numbers', true, true) == 'IgNoRe 77 ThE 444 nUmBeRs'

# # 7

# def show_multiplicative_average(arr)
#   product = 1.0
#   arr.each {|n| product *= n}
#   format('%.3f', product / arr.size)
# end

# p show_multiplicative_average([3, 5])
# # The result is 7.500

# p show_multiplicative_average([6])
# # The result is 6.000

# p show_multiplicative_average([2, 5, 7, 11, 13, 17])
# # The result is 28361.667

# # 8

# def multiply_list(arr1, arr2)
#   # arr3 = []
#   # index = 0
#   # while index < arr1.size
#   #   arr3 << arr1[index] * arr2[index]
#   #   index += 1
#   # end

#   arr1.zip(arr2).map {|sub_arr| sub_arr.inject(:*)}
#   # arr3
# end

# p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]

# # 9

# def multiply_all_pairs(arr1, arr2)
#   arr1.product(arr2).map {|sub_arr| sub_arr.reduce(:*)}.sort
# end

# p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]

# 10

def penultimate(str, mid_split = "right")
  arr = str.split(' ')
  return '' if arr.size == 0 || arr.size == 1
  middle = (arr.size / 2.0).floor
  middle = (arr.size / 2.01).floor if mid_split != "right"
  # puts middle
  arr[middle]
end

p penultimate('one') == ''
p penultimate('') == ''
# p penultimate('last word') == 'last'
# p penultimate('Launch School is great!') == 'is'
p penultimate('Launch School is great!', 'right') == 'is'
p penultimate('Launch School is great!', 'left') == 'School'

