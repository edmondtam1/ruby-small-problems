# 1

# def step(first, last, increment)
#   current = first
#   while current <= last
#     yield current
#     break if current + increment > last
#     current += increment
#   end
#   current
# end

# p step(1, 11, 3) { |value| puts "value = #{value}" }

# 2

# def zip(arr1, arr2)
#   result = []
#   0.upto(arr1.size - 1) do |i|
#     result << [arr1[i], arr2[i]]
#   end
#   result
# end

# p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]

# 3

# def map(arr)
#   arr.each_with_object([]) do |item, obj|
#     obj << yield(item)
#   end
# end

# p map([1, 3, 6]) { |value| value**2 } == [1, 9, 36]
# p map([]) { |value| true } == []
# p map(['a', 'b', 'c', 'd']) { |value| false } == [false, false, false, false]
# p map(['a', 'b', 'c', 'd']) { |value| value.upcase } == ['A', 'B', 'C', 'D']
# p map([1, 3, 4]) { |value| (1..value).to_a } == [[1], [1, 2, 3], [1, 2, 3, 4]]

# 4

# def count(*args)
#   counter = 0
#   args.each do |arg|
#     counter += 1 if yield(arg)
#   end
#   counter
# end

# p count(1, 3, 6) { |value| value.odd? } == 2
# p count(1, 3, 6) { |value| value.even? } == 1
# p count(1, 3, 6) { |value| value > 6 } == 0
# p count(1, 3, 6) { |value| true } == 3
# p count() { |value| true } == 0
# p count(1, 3, 6) { |value| value - 6 } == 3

# 5

# def drop_while(arr)
#   # false_seen = false
#   # arr.each_with_index do |item, index|
#   #   false_seen = true unless yield(item)
#   #   if false_seen
#   #     return arr[index..-1]
#   #     break
#   #   end
#   # end
#   # []

#   index = 0
#   while index < arr.size
#     break unless yield(arr[index])
#     index += 1
#   end
#   arr[index..-1]
# end

# p drop_while([1, 3, 5, 6]) { |value| value.odd? } == [6]
# p drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]
# p drop_while([1, 3, 5, 6]) { |value| true } == []
# p drop_while([1, 3, 5, 6]) { |value| false } == [1, 3, 5, 6]
# p drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
# p drop_while([]) { |value| true } == []

# 6

# def each_with_index(arr)
#   index = 0
#   while index < arr.size
#     yield(arr[index], index)
#     index += 1
#   end
#   arr
# end

# result = each_with_index([1, 3, 6]) do |value, index|
#   puts "#{index} -> #{value**index}"
# end

# puts result == [1, 3, 6]

# 7

# def each_with_object(arr, obj)
#   arr.each do |item|
#     yield(item, obj)
#   end
#   obj
# end

# result = each_with_object([1, 3, 5], []) do |value, list|
#   list << value**2
# end
# p result == [1, 9, 25]

# result = each_with_object([1, 3, 5], []) do |value, list|
#   list << (1..value).to_a
# end
# p result == [[1], [1, 2, 3], [1, 2, 3, 4, 5]]

# result = each_with_object([1, 3, 5], {}) do |value, hash|
#   hash[value] = value**2
# end
# p result == { 1 => 1, 3 => 9, 5 => 25 }

# result = each_with_object([], {}) do |value, hash|
#   hash[value] = value * 2
# end
# p result == {}

# 8

# def max_by(arr)
#   return nil if arr.empty?
#   max = arr[0]

#   arr[1..-1].each do |item|
#     max = item if yield(item) > yield(max)
#   end
#   max
# end

# p max_by([1, 5, 3]) { |value| value + 2 } == 5
# p max_by([1, 5, 3]) { |value| 9 - value } == 1
# p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
# p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
# p max_by([-7]) { |value| value * 3 } == -7
# p max_by([]) { |value| value + 5 } == nil

# 9 & 10

def each_cons(arr, cons_len = 2)
  # index = 0
  # while index < arr.size - 1
  #   range = index + 1..index + cons_len - 1
  #   yield(arr[index], arr[range])
  #   index += 1
  # end
  # nil

  arr.each_index do |idx|
    break if idx + cons_len > arr.size
    yield(*arr[idx..(idx + cons_len - 1)])
  end
  nil
end

hash = {}
result = each_cons([1, 3, 6, 10]) do |value1, value2|
  hash[value1] = value2
end
p result == nil
p hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
result = each_cons([]) do |value1, value2|
  hash[value1] = value2
end
p hash == {}
p result == nil

hash = {}
result = each_cons(['a', 'b']) do |value1, value2|
  hash[value1] = value2
end
p hash == {'a' => 'b'}
p result == nil

hash = {}
each_cons([1, 3, 6, 10], 1) do |value|
  hash[value] = true
end
p hash == { 1 => true, 3 => true, 6 => true, 10 => true }

hash = {}
each_cons([1, 3, 6, 10], 2) do |value1, value2|
  hash[value1] = value2
end
p hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
each_cons([1, 3, 6, 10], 3) do |*values|
  hash[values[0]] = values[1..2]
end
p hash
p hash == { 1 => [3, 6], 3 => [6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 4) do |value1, *values|
  hash[value1] = values
end
p hash == { 1 => [3, 6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 5) do |value1, *values|
  hash[value1] = values
end
p hash == {}
