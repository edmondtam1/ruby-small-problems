# 1

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
ans = {}

flintstones.each_with_index do |v, i|
  ans[v] = i
end

p ans 

# 2

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

p ages.values.sum

# 3

ages2 = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages2_ans = ages2.reject do |k, v|
  v > 100
end

# ages2_ans = ages2.select do |k, v|
#   v < 100
# end

p ages2_ans

# 4

ages.values.min

# 5

flintstones2 = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones2_ans = flintstones2.index do |v|
  v[0..1] == "Be"
end
  
p flintstones2_ans
  
# 6

flintstones_6 = flintstones2.map do |v|
  v[0..2] # or v[0, 3]
end

p flintstones_6

# 7

statement = "The Flintstones Rock"
statement_hsh = {}

statement.each_char do |v|
  statement_hsh[v] ? statement_hsh[v] += 1 : statement_hsh[v] = 1
end

p statement_hsh

# result = {}
# letters = ('A'..'Z').to_a + ('a'..'z').to_a
# letters.each do |letter|
#   letter_frequency = statement.scan(letter).count
#   result[letter] = letter_frequency if letter_frequency > 0
# end

# 9

words = "the flintstones rock"
# words_ans = []

# # words_ans = words.split(' ').each do |v|
# #   v.capitalize!
# # end

# p words_ans.join(' ')

words.split(' ').map {|word| word.capitalize }.join(' ') 

# 10

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

# munsters.each_with_index do |v, i|
#   case v[1]["age"]
#   when 0..17
#     v[1]["age_group"] = "kid"
#   when 18..64
#     v[1]["age_group"] = "adult"
#   else
#     v[1]["age_group"] = "senior"
#   end
# end

munsters.each do |name, details|
  case details["age"]
  when 0...18
    details["age_group"] = "kid"
  when 18...65
    details["age_group"] = "adult"
  else
    details["age_group"] = "senior"
  end
end

p odd_numbers

