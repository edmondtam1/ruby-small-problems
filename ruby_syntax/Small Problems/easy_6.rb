# # 1

# DEGREE = "\xC2\xB0"
# MINUTES = 60
# SECONDS = 60
# SEC_IN_DEG = MINUTES * SECONDS

# def dms(float)
#   deg = (float % 360).floor
#   rem = (float % 360) % 1 * MINUTES
#   min, sec = rem.divmod(1)
#   sec = (sec*SECONDS).round
#   if sec == SECONDS
#     min += 1
#     sec = 0
#   end
#   format('%d%s%02d\'%02d"', deg, DEGREE, min, sec) 
# end

# p dms(30) == %(30°00'00")
# p dms(76.73) == %(76°43'48")
# p dms(254.6) == %(254°36'00")
# p dms(93.034773) == %(93°02'05")
# p dms(0) == %(0°00'00")
# p dms(360) == %(360°00'00") || dms(360) == %(0°00'00")
# p dms(361.1)
# p dms(-1.1)

# # 2

# def remove_vowels(strings)
#   strings.map {|str| str.gsub(/[aeiou]/i, '')}
    # can use str.delete too
# end

# p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
# p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
# p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']

# # 3 - array solution is probably taking up a lot of memory

# def find_fibonacci_index_by_length1(int)
#   arr = [1, 1]
#   while arr[-1].digits.size < int
#     arr << arr[-2] + arr[-1]
#   end
#   arr.size
# end

# def find_fibonacci_index_by_length(int)
#   first = 1
#   second = 1
#   index = 2

#   loop do
#     index += 1
#     fib = first + second
#     break if fib.to_s.size >= int

#     first = second
#     second = fib
#   end
#   index
# end

# p find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
# p find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
# p find_fibonacci_index_by_length(10) == 45
# p find_fibonacci_index_by_length(100) == 476
# p find_fibonacci_index_by_length(1000) == 4782
# p find_fibonacci_index_by_length(10000) == 47847

# # 4

# def reverse!(arr)
#   start = 0
#   last = -1
#   while start <= arr.size / 2 - 1
#     arr[start], arr[last] = arr[last], arr[start]
#     start += 1
#     last -= 1
#   end
#   arr
# end

# list = [1,2,3,4]
# result = reverse!(list) # => [4,3,2,1]
# p list == [4, 3, 2, 1]
# p list.object_id == result.object_id

# list = %w(a b c d e)
# p reverse!(list) # => ["e", "d", "c", "b", "a"]
# p list == ["e", "d", "c", "b", "a"]

# list = ['abc']
# p reverse!(list) # => ["abc"]
# p list == ["abc"]

# list = []
# p reverse!(list) # => []
# p list == []

# # 5

# def reverse2(arr)
#   new_arr = []
#   # start = 0
#   # last = -1
#   arr.each do |i|
#     new_arr.unshift(i)
#   end

#   # this is actually terrible
#   # while start < arr.size / 2
#   #   new_arr.insert(start, arr[last])
#   #   new_arr.insert(last, arr[start])
#   #   new_arr.insert(start + 1, arr[last - 1]) if arr.size.odd? && arr.size / 2 == start + 1
#   #   start += 1
#   #   last -= 1
#   # end
#   new_arr
# end

# def reverse(arr)
#   arr.each_with_object([]) do |i, a|
#     a.unshift i
#   end
# end

# p reverse([1,2,3,4]) == [4,3,2,1]          # => true
# p reverse(%w(a b c d e)) == %w(e d c b a)  # => true
# p reverse(['abc']) == ['abc']              # => true
# p reverse([]) == []                        # => true

# list = [1, 2, 3]                      # => [1, 2, 3]
# p new_list = reverse(list)              # => [3, 2, 1]
# p list.object_id != new_list.object_id  # => true
# p list == [1, 2, 3]                     # => true
# p new_list == [3, 2, 1]                 # => true

# # 6

# def merge(arr1, arr2)
#   arr1 << arr2
#   arr1.flatten.uniq
#   # arr1 | arr2
# end

# p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]

# # 7 - originally tried to get the "half" figure using a convoluted if-else statement

# def halvsies(arr)
#   half = (arr.size / 2.0).round
#   first = arr[0..half - 1]
#   second = arr[first.size..arr.size - 1]
#   p [first, second]
# end

# def halvsies2(arr)
#   first = arr.slice(0, (arr.size / 2.0).ceil)
#   second = arr.slice(first.size, arr.size - first.size)
#   [first, second]
# end

# p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
# p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
# p halvsies([5]) == [[5], []]
# p halvsies([]) == [[], []]

# # 8

# def find_dup(arr)
#   hsh = Hash.new(0)
#   result = nil
#   arr.each do |i|
#     result = i if hsh[i] == 1
#     hsh[i] += 1
#   end
#   result
# end

# def find_dup(arr)
#   arr.find { |e| arr.count(e) == 2 }
# end

# p find_dup([1, 5, 3, 1]) == 1
# p find_dup([18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
#           38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
#           14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
#           78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
#           89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
#           41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
#           55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
#           85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
#           40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
#           7,  34, 57, 74, 45, 11, 88, 67,  5, 58]) == 73

# # 9

# def include?(arr, int)
#   # arr.each {|n| return true if n == int}
#   # false
#   new_arr = arr.select {|n| n == int}
#   return true if new_arr.size > 0
#   false
# end

# p include?([1,2,3,4,5], 3) == true
# p include?([1,2,3,4,5], 6) == false
# p include?([], 3) == false
# p include?([nil], nil) == true
# p include?([], nil) == false

# 10

def triangle(int)
  spaces = int
  stars = 0
  (int+1).times do |i|
    puts " " * spaces + "*" * stars
    spaces -= 1
    stars += 1
  end
end

def rev_triangle(int)
  spaces = 0
  stars = int
  (int+1).times do |i|
    puts " " * spaces + "*" * stars
    spaces += 1
    stars -= 1
  end
end

def triangle(int, side = "left", point_at = "top")
  index = 1
  while index < int + 1 do
    stars = if point_at == "top"
      "*" * (int - index + 1)
    else
      "*" * index
    end
    if side == "left"
      puts "#{stars.ljust(int)}"
    else
      puts "#{stars.rjust(int)}"
    end
    index += 1
  end
end

triangle(5)
rev_triangle(5)
triangle(5, "right", "not")
triangle(5, "right", "top")
triangle(5, "left", "not")
triangle(5, "left", "top")