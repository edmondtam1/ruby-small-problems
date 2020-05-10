# def welcome(str)
#   p block_given?
# end



# welcome('Hello') { 'there' } # => Hello there
# welcome('Hey') 

# def true_or_false(&block)
#   puts "The block is #{block.call}"
# end

# true_or_false { 5 > 8 }

# def call_chunk(code_chunk)
#   code_chunk.call
# end

# # color = 'red'
# say_color = Proc.new {puts "The color is #{color}"}
# color = "blue"
# call_chunk(say_color)

# p [2, 3, 5].inject(1, &:+)

# p [2, 3, 5].inject(1) { |total, num| total + num }

ARRAY = [1, 2, 3]

def abc
  a = 3
end

def xyz(collection)
  collection.map { |x| yield x }
end

xyz(ARRAY) do
  p xyz([1, 2])
end
