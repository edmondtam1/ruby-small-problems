# 1
name = 'Ed' + 'Tam'

# 2
num = 3456
thou = num / 1000
hund = num % 1000 / 100
tens = num % 1000 % 100 / 10
ones = num % 1000 % 100 % 10

puts "#{thou} #{hund} #{tens} #{ones}"

# 3
titles = {
  "hi" => 2004,
  "there" => 1992,
  "world" => 2000,
  "nice" => 1935,
  "meeting" => 1952,
  "you" => 1960
}
# titles.each {|k,v| puts v}
puts titles['hi']
puts titles['there']
puts titles['world']
puts titles['nice']
puts titles['meeting']
puts titles['you']

# 4
dates = [2004, 1992, 2000, 1935, 1952, 1960]

puts dates[0]
puts dates[1]
puts dates[2]
puts dates[3]
puts dates[4]
puts dates[5]

# 5
a = 5 * 4 * 3 * 2 * 1
b = a * 6
c = b * 7
d = c * 8
puts a
puts b
puts c
puts d

# 6
puts 3.5 ** 2
puts 7.5 ** 2
puts 85 ** 2
