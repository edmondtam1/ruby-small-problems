# require "pry" # add this to use Pry

# counter = 0

# loop do
#   counter += 1
#   binding.pry # execution will stop here
#   break if counter == 5
# end

def print_id number
  number = 4
  puts "In method object id = #{number.object_id}"
end

value = 33
puts "Outside method object id = #{value.object_id}"
print_id value
puts "Outside method object id after method = #{value.object_id}"

str = "hi"
puts "Outside method object id = #{str.object_id}"
print_id str

arr = [1, 2, 3]
puts "Outside method object id = #{arr.object_id}"
print_id arr

# def name
#   "George"
# end

# name = "Lisa"

# def display_name
#   puts name
# end

# display_name

# def name
#   "George"
# end

# name = "Lisa"

# def display_name(name)
#   puts name
# end

# display_name(name)

# name = "Lisa"

# def name
#   "George"
# end

# loop do
#   puts name
#   break
# end
