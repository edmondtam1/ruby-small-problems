loop do
  puts "What's your ans"
  a = gets.chomp
  if a == "STOP"
    break
  end
end

# or

x = ""
while x != "STOP" do
  puts "Hi"
  ans = gets.chomp
  puts "Want?"
  x = gets.chomp
end

# 3

arr = [1, 2, 3, 5, 6, 8, 11]
arr.each_with_index {|v,k| puts "#{k} and #{v}"}

# 4

def to_zero(x)
  if x<0
    puts "Done!"
  else
    puts x
    to_zero(x-1)
  end
  
end

to_zero(15)