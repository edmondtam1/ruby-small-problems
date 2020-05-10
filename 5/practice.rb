# 1

# arr = ['10', '11', '9', '7', '8']

# ans = arr.sort do |a, b|
#   b.to_i <=> a.to_i
# end

# p ans

# 2

# books = [
#   {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
#   {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
#   {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
#   {title: 'Ulysses', author: 'James Joyce', published: '1922'}
# ]

# ans2 = books.sort_by do |hsh|
#   # hsh[:published].to_i
#   hsh[:published]
# end

# p ans2

# 3

# arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]

# arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]

# arr3 = [['abc'], ['def'], {third: ['ghi']}]

# hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}

# hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}

# p arr1[-1][-1][-1]
# p arr2[1][:third][0]
# p arr3[2][:third][0][0]
# p hsh1['b'][1]
# p hsh2[:third].keys[0]

# 4

# arr1 = [1, [2, 3], 4]

# arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]

# hsh1 = {first: [1, 2, [3]]}

# hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}

# arr1[1][1] = 4
# arr2[-1] = 4
# hsh1[:first][2][0] = 4
# hsh2[['a']][:a][2] = 4
# p arr1
# p arr2
# p hsh1
# p hsh2

# 5

# munsters = {
#   "Herman" => { "age" => 32, "gender" => "male" },
#   "Lily" => { "age" => 30, "gender" => "female" },
#   "Grandpa" => { "age" => 402, "gender" => "male" },
#   "Eddie" => { "age" => 10, "gender" => "male" },
#   "Marilyn" => { "age" => 23, "gender" => "female"}
# }

# sum = 0
# munsters.select {|k, v| sum += v["age"] if v["gender"] == "male"}
# # munsters.each_value {|v| sum += v["age"] if v["gender"] == "male"}
# p sum

# 6

# munsters.each do |k, v|
#   puts "#{k} is a #{v["age"]}-year-old #{v["gender"]}."
# end

# 7

# arr[0] => 4
# arr[1][0] => 1
# a = 4, b = [1, 8]

# 8

# hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

# vowels = ""
# hsh.each do |_, arr|
#   arr.each do |word|
#     word.each_char do |c|
#       # vowels += c if 'aeiou'.match(c)
#       puts c if 'aeiou'.include?(c)
#     end
#   end
# end

# p vowels

# 9

# arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

# ans = arr.map do |sub|
#   sub.sort do |a, b|
#     b <=> a
#   end
# end

# p ans

# 10

# ans = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}].map do |hsh|
#   new_hsh = {}
#   hsh.each do |k, v|
#     new_hsh[k] = v + 1
#   end
#   new_hsh # this returns the new_hsh to the array
# end

# p ans

# ans2 = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}].each_with_object([]) do |hsh, arr|
#   new_hsh = {}
#   hsh.each do |k, v|
#     new_hsh[k] = v + 1
#   end
#   arr << new_hsh
# end

# p ans2

# 11

# arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

# ans = arr.map do |sub|
#   sub.select do |v|
#     v % 3 == 0
#   end
# end

# p ans

# 12

# arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]

# hsh = {}

# arr.each do |sub|
#   hsh[sub[0]] = sub[1]
# end

# p hsh

# 13

# arr = [[1, 6, 7], [1, 4, 9], [1, 3, 2], [1, 8, 3]]

# ans = arr.sort_by do |sub|
#   new_arr = []
#   sub.select do |v|
#     new_arr << v if v.odd?
#   end
#   new_arr
# end

# what appears to happen is sort_by will look at the return value in the block
# subsequently based on that return value, it will sort_by original array
# arr.sort_by do |sub_arr|
#   sub_arr.select do |num|
#     num.odd?
#   end
# end

# p ans

# 14

# hsh = {
#   'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
#   'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
#   'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
#   'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
#   'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
# }

# ans = hsh.map do |(_, v)|
#   if v[:type] == "fruit"
#     v[:colors].map {|c| c.capitalize}
#   else
#     v[:size].upcase if v[:type] == "vegetable"
#   end
# end

# p ans

# 15

# arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

# This solves a different problem!!

# new_arr = []
# arr.map do |hsh|
#   new_hsh = {}
#   hsh.map do |k, v|
#     check = v.select do |num|
#       num.even?
#     end
#     new_hsh[k] = v if check.size == v.size
#   end
#   new_arr << new_hsh unless new_hsh.size == 0
# end
# p new_arr

# ans = arr.select do |hsh|
#   hsh.all? do |_, v|
#     v.all? do |num|
#       num.even?
#     end
#   end
# end

# p ans

# 16

# clearly not ideal
# def create_UUID
#   str = ''
#   8.times do |_| 
#     str << random_char.to_s.gsub('"', '')
#   end
#   str << "-"
#   4.times do |_| 
#     str << random_char.to_s.gsub('"', '')
#   end
#   str << "-"
#   4.times do |_| 
#     str << random_char.to_s.gsub('"', '')
#   end
#   str << "-"
#   4.times do |_| 
#     str << random_char.to_s.gsub('"', '')
#   end
#   str << "-"
#   12.times do |_| 
#     str << random_char.to_s.gsub('"', '')
#   end
#   str
# end

# def random_char
#   charset = Array(0..9) + Array('a'..'f')
#   charset.sample
# end

# p random_char
# p create_UUID

# def generate_UUID
#   charset = []
#   (0..9).each {|digit| charset << digit.to_s}
#   ('a'..'f').each {|digit| charset << digit}

#   uuid = ""
#   sections = [8, 4, 4, 4, 12]
#   sections.each_with_index do |section, index|
#     section.times {|_| uuid << charset.sample}
#     uuid << '-' unless index >= sections.size - 1
#   end

#   uuid
# end

def generate_UUID2
  charset = []
  (0..9).each {|digit| charset << digit.to_s}
  ('a'..'f').each {|digit| charset << digit}

  uuid = ""
  sections = [8, 4, 4, 4, 12]
  counter = 0
  sections.each do |num|
    num.times {uuid << charset.sample}
    counter += 1
    uuid << '-' unless counter == sections.size
    
  end
  uuid

end

p generate_UUID2

