# perform again

# loop do
#   puts "Do you really wanna do that again? Y/N"
#   ans = gets.chomp
#   if ans != "Y"
#     break
#   end
# end

x = 0

while x <= 10
  if x == 3
    x += 1
    next
  elsif x.odd?
    puts x
  end
  x += 1
end

x = 0

while x <= 10
  if x == 7
    break
  elsif x.odd?
    puts x
  end
  x += 1
end