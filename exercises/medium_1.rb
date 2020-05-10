# 1

# class Device
#   def initialize
#     @recordings = []
#   end

#   def record(recording)
#     @recordings << recording
#   end

#   def listen
#     record(yield) if block_given?
#   end

#   def play
#     @recordings.last
#   end
# end

# listener = Device.new
# p listener.listen { "Hello World!" }
# p listener.listen
# p listener.play # Outputs "Hello World!"

# 3

# def gather(items)
#   puts "Let's start gathering food."  
#   yield(items)
#   puts "Nice selection of food we have gathered!"
# end

# items = ['apples', 'corn', 'cabbage', 'wheat']

# gather(items) do |items|
#   puts "#{items.join(', ')}"
# end

# 4

# def grouped_array(arr)
#   yield(arr)
# end

# grouped_array([1, 2, 3, 4]) do |_, _, *raptors|
#   puts raptors
# end

# raven, finch, *raptors = %w(raven finch hawk eagle)
# p raven # => 'raven'
# p finch # => 'finch'
# p raptors  # => ['hawk','eagle']

# 5

# items = ['apples', 'corn', 'cabbage', 'wheat']

# def gather(items)
#   puts "Let's start gathering food."
#   yield(items)
#   puts "We've finished gathering!"
# end

# gather(items) do |*first, last|
#   puts first.join(' ')
#   puts last
# end

# gather(items) do |first, *middle, last|
#   puts first
#   puts middle.join(' ')
#   puts last
# end

# gather(items) do |first, *last|
#   puts first
#   puts last.join(' ')
# end

# gather(items) do |first, second, third, last|
#   puts "#{first}, #{second}, #{third}, and #{last}"
# end

# 6

# def convert_to_base_8(n)
#   n.to_s(8).to_i # replace these two method calls
# end

# def convert_to_string(n)
#   puts "This is #{n.to_s}"
# end

# # The correct type of argument must be used below
# base8_proc = method(:convert_to_base_8).to_proc
# string_proc = method(:convert_to_string).to_proc

# # We'll need a Proc object to make this code work. Replace `a_proc`
# # with the correct object
# p [8, 10, 12, 14, 16, 33].map(&base8_proc)
# p [8, 10, 12, 14, 16, 33].map(&string_proc)

# 7

def bubble_sort!(array)
  loop do
    swapped = false
    1.upto(array.size - 1) do |index|
      to_next = block_given? ? yield(array[index - 1], array[index]) : array[index - 1] <= array[index]
      next if to_next
      array[index - 1], array[index] = array[index], array[index - 1]
      swapped = true
    end
    break unless swapped
  end
  nil
end

array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [5, 3, 7]
bubble_sort!(array) { |first, second| first >= second }
p array == [7, 5, 3]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = [6, 12, 27, 22, 14]
bubble_sort!(array) { |first, second| (first % 7) <= (second % 7) }
p array == [14, 22, 12, 6, 27]

array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort!(array)
p array == %w(Kim Pete Tyler alice bonnie rachel sue)

array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort!(array) { |first, second| first.downcase <= second.downcase }
p array == %w(alice bonnie Kim Pete rachel sue Tyler)
