# # 1

# age = [*(20..200)].sample

# puts "Teddy is #{age} years old!"

# # 2

# SQMTRS_TO_SQFT = 10.7639

# puts "Enter length in meters:"
# length = gets.chomp.to_i

# puts "Enter width in meters:"
# width = gets.chomp.to_i

# result = length * width
# result_feet = SQMTRS_TO_SQFT * result

# puts "The area of the room is #{result} square meters (#{result_feet} square feet)."

# # 3

# print "What is the bill? "
# bill_1 = gets.chomp.to_f

# print "What is the tip percentage? "
# tip_per = gets.chomp.to_f

# tip = bill_1 * tip_per / 100

# total = bill_1 + tip

# puts "The tip is $#{sprintf("%d.00", tip)}."
# puts "The total is $#{sprintf("%d.00", total)}."

# # 4

# THIS_YEAR = 2018

# print "What is your age? "
# get_age = gets.chomp.to_i

# print "At what age would you like to retire? "
# get_retire = gets.chomp.to_i

# # current_year = Time.now.year
# years_to_retire = get_retire - get_age
# retire_year = THIS_YEAR + years_to_retire

# puts "It's 2018. You will retire in #{retire_year}."
# puts "You have only #{years_to_retire} years of work to go!"

# 5

# print "What is your name? "
# name = gets.chomp

# if name[name.length - 1] == "!" # name[-1]
#   puts "HELLO #{name[0..name.length - 2].upcase}. WHY ARE WE SCREAMING?"
# else
#   puts "Hello #{name.capitalize}."
# end

# print "What is your name? "
# name = gets.chomp!

# if name[-1] == "!"
#   name = name.chop!
#   puts "HELLO #{name.upcase}. WHY ARE WE SCREAMING?"
# else
#   puts "Hello #{name}."
# end

# 6

# arr = [*(1..99)]

# arr.each {|n| puts n if n % 2 == 1}

# puts arr.select {|n| n.odd? }

# 1.upto(99) {|n| puts n if n % 2 == 1 } # if n.odd?

# 7

# puts arr.select {|n| n.even? }

# 8

puts ">> Please enter an integer greater than 0:"
int = gets.chomp.to_i
puts ">> Enter 's' to compute the sum, 'p' to compute the product."
oper = gets.chomp

case oper
when "s"
  # result = [*(1..int)].sum
  result = 1.upto(int).inject { |sum, n| sum + n}
  puts "The sum of the integers between 1 and #{int} is #{result}."
when "p"
  # result = 1
  # [*(1..int)].each {|n| result *= n}
  result = 1.upto(int).inject { |prod, n| prod * n}
  puts "The product of the integers between 1 and #{int} is #{result}."
else
  puts "Foolish behaviour."
end

# 9

# Variable name is initialized on line 1 to point at String object "Bob"
# When save_name is initialized, it points at the same String object "Bob"
# Calling method upcase! on name mutates the caller, so "Bob" becomes "BOB"
# Method call puts with arguments name, save_name prints out "BOB\nBOB"

# 10

# Array 2 is the same as Array 1
