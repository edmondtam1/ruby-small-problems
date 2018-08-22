# def print_me
#   "I'm printing the return value!"
# end

# puts print_me

# def hello
#   "Hello"
# end

# def world
#   "World"
# end

# def greet
#   hello + ' ' + world
# end

# puts greet

# def car(str1, str2)
#   puts str1 + ' ' + str2
# end

# car('Toyota', 'Corolla')

# def time_of_day(bool)
#   if bool
#     puts "It's daytime!"
#   else
#     puts "It's nighttime!"
#   end
# end

# daylight = [true, false].sample
# time_of_day(daylight)

# def dog(name)
#   return name
# end

# def cat(name="Ginger")
#   return name
# end

# puts "The dog's name is #{dog('Spot')}."
# puts "The cat's name is #{cat}."
# can put cat('Ginger') instead

# def assign_name(name = "Bob")
#   name
# end

# puts assign_name('Kevin') == 'Kevin'
# puts assign_name == 'Bob'

# def add(int1, int2)
#   int1 + int2
# end

# def multiply(int1, int2)
#   int1 * int2
# end

# puts add(2, 2) == 4
# puts add(5, 4) == 9
# puts multiply(add(2, 2), add(5, 4)) == 36

def name(arr)
  # arr[rand(arr.length)]
  arr.sample
end

def activity(arr)
  # arr[rand(arr.length)]
  arr.sample
end

def sentence(name, activity)
  # name + ' is ' + activity + ' right now!'
  "#{name} is #{activity} literally now!"
end

names = ['Dave', 'Sally', 'George', 'Jessica']
activities = ['walking', 'running', 'cycling']

puts sentence(name(names), activity(activities))