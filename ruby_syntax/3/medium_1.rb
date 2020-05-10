require 'pry'

# 1

# text = "The Flintstones Rock!"
# counter = 0

# while counter < 10
#   puts text.prepend(" ")
#   counter += 1
# end

# 10.times {|x| puts (" " * x) + "The Flintstones Rock!"}

# 3

def factors(number)
  dividend = number
  divisors = []
  while dividend > 0 do
    divisors << number / dividend if number % dividend == 0
    dividend -= 1
  end
  divisors
end

puts factors(28)
puts factors(-3)
puts factors(0)