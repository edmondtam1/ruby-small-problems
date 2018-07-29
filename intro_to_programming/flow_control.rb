# Exercise 2
def upper_over_10 (string)
  if string.length > 10
    string.upcase
  else
    string
  end
end

puts upper_over_10("hello there hi!!")

# 3
def report
  puts "What's your num?"
  num = gets.chomp.to_i
  if num >= 0 && num <= 50
    puts 'Less than 50'
  elsif num > 50 && num <= 100
    puts "Greater than 50"
  elsif num > 100
    puts "Greater than 100"
  else
    puts "Less than 0?!"
  end
end

report

# 4
# 1. False
# 2. Did you get it right?
# 3. Alright now

# 5
def report2(num)
  
  case num
  when 0..50
    puts "#{num} is bet 0 and 50"
  when 51..100
    puts "#{num} is bet 51 and 100"
  else
    if num < 0
      puts "#{num} is negative?!"
    else
      puts "#{num} is > 100"
    end
  end
end

def report3(num)
  case
  when num < 0
    puts "Negative"
  when num <= 50
    puts "<=50"
  when num <=100
    puts "<=100"
  else puts "#{num} is > 100"
  end
end
  
puts "What's your num?"
num = gets.chomp.to_i
report2(num)
report3(num)