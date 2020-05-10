# 3

advice = "Few things in life are as important as house training your pet dinosaur."
puts advice.sub('important', 'urgent')
# advice.gsub!('important', 'urgent')

# 5

puts (10..100).to_a.include?(42) # no need to_a
# (10..100).cover?(42)

# 6

four = "Four score and "
famous_words = "seven years ago..."

one_way = four + famous_words
another_way = "#{four}#{famous_words}"
p one_way
p another_way

