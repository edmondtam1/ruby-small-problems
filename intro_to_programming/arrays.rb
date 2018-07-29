# 1
arr = [1, 3, 5, 7, 9, 11]
number = 3

arr.each do |x|
  if x == number
    puts "yes"
  end
end

if arr.include?(number)
  puts "in"
end

# 7

arr = [1, 2, 4, 7, 9]
arr2 = arr.map {|n| n + 2}

# or

arr3 = []
arr.each {|x| arr3 << x + 2}

p arr
p arr2
p arr3
