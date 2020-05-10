# produce = {
#   'apple' => 'Fruit',
#   'carrot' => 'Vegetable',
#   'pear' => 'Fruit',
#   'broccoli' => 'Vegetable'
# }

# def select_fruit(hsh)
#   key_arr = hsh.keys
#   count = 0
#   answer = {}

#   loop do
#     break if count == key_arr.size
#     if hsh[key_arr[count]] == 'Fruit'
#       answer[key_arr[count]] = 'Fruit'
#     end

#     count += 1
#   end

#   answer
# end

# puts select_fruit(produce)

# def double_numbers!(numbers)
#   counter = 0

#   loop do
#     break if counter == numbers.size

#     numbers[counter] *= 2

#     counter += 1
#   end

#   numbers
# end

# arr = [1, 3, 45, 2]
# puts double_numbers!(arr)
# puts arr

# def double_numbers!(numbers)
#   counter = 0

#   loop do
#     break if counter == numbers.size

#     numbers[counter] *= 2 if counter.odd?

#     counter += 1
#   end

#   numbers
# end

# arr = [1, 3, 45, 2]
# puts double_numbers!(arr)
# puts arr

# def multiply(arr, times)
#   counter = 0

#   loop do
#     break if counter == arr.size

#     arr[counter] *= times

#     counter += 1
#   end

#   arr
# end

# arr = [1, 3, 45, 2]
# puts multiply(arr, 3)

hi = { a: 'ant', b: 'bear', c: 'cat'}.map do |key, value|
  if value.size < 4
    value
  end
end

p hi 
