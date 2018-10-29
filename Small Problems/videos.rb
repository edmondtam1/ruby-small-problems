# Calculate number of Friday the 13ths

# require 'date'

# def friday_13th?(year)
#   # iterate through 13th of each month
#   # check if it's Friday
#   counter = 0
#   (1..12).each do |month|
#     counter += 1 if Date.new(year, month, 13).friday?
#   end
#   counter
# end

# p friday_13th?(2015)
# p friday_13th?(1986)
# p friday_13th?(1992)
# p friday_13th?(1995)
# p friday_13th?(2018)

# Generate random English math problems

# NUMBERS = %w(zero one two three four five six seven eight nine ten)
# OPERATORS = %w(plus minus times divided)

# def mathphrase(num)
#   phrase = []
#   num.times do |n|
#     phrase << NUMBERS.sample
#     phrase << OPERATORS.sample
#   end
#   phrase << NUMBERS.sample
#   phrase.join(' ').gsub('divided', 'divided by')
# end

# p mathphrase(3)
# p mathphrase(4)
# p mathphrase(5)

# def random_phrase(num)
#   num.times {|_| p mathphrase((1..20).to_a.sample)}
# end

# random_phrase(1000)




