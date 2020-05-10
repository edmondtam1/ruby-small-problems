# 1

# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

# p ages.assoc("Spot") # less preferred answer
# p ages.key?("Spot")
# p ages.include?("Spot")
# p ages.member?("Spot")

# 2

munsters_description = "The Munsters are creepy in a good way."

puts munsters_description.capitalize
puts munsters_description.swapcase
puts munsters_description.downcase
puts munsters_description.upcase

# 3

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
additional_ages = { "Marilyn" => 22, "Spot" => 237 }

puts ages.merge!(additional_ages)

# 4

advice = "Few things in life are as important as house training your pet dinosaur."

p advice.match("Dino")

# 5

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# 6

flintstones << "Dino"

# 7

flintstones.push("Dino").push("Hoppy")

# 8 

advice = "Few things in life are as important as house training your pet dinosaur."

p advice[0...advice.index('house')]
p advice.slice!(0, advice.index('house'))

# 9

statement = "The Flintstones Rock!"

p statement.count "t"

# 10

title = "Flintstone Family Members"

p title.center(40)
