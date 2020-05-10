# # implementing times method

# def times(number)
#   counter = 0
#   while counter < number do
#     yield(counter)
#     counter += 1
#   end

#   number
# end

# times(5) do |num|
#   puts num
# end

# writing select method

# def select(array)
#   counter = 0
#   new_arr = []

#   while counter < array.size
#     new_arr << array[counter] if yield(array[counter])
#     counter += 1
#   end

#   new_arr
# end

# array = [1, 2, 3, 4, 5]

# p select(array) { |num| num.odd? }      # => [1, 3, 5]
# p select(array) { |num| puts num }      # => [], because "puts num" returns nil and evaluates to false
# p select(array) { |num| num + 1 }       # => [1, 2, 3, 4, 5]

# writing reduce method

def reduce(array, accum = omitted = true)
  accum = omitted ? array[0] : accum
  counter = omitted ? 1 : 0

  while counter < array.size
      accum = yield(accum, array[counter])
      counter += 1
  end

  accum
end

array = [1, 2, 3, 4, 5]

p reduce(array) { |acc, num| acc + num }                    # => 15
p reduce(array, 1) { |acc, num| acc + num }                # => 25
p reduce(['a', 'b', 'c']) { |acc, value| acc += value }     # => 'abc'
p reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value } # => [1, 2, 'a', 'b']
# p reduce(array) { |acc, num| acc + num if num.odd? }        # => NoMethodError: undefined method `+' for nil:NilClass

