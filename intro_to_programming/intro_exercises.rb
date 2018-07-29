# 1

[1, 2, 3, 4, 5, 6, 7, 8, 9, 10].each {|x| puts x}

# 2

[1, 2, 3, 4, 5, 6, 7, 8, 9, 10].each {|x| puts x if x > 5}

# 3

odd_arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].select {|x| x%2 != 0}
  
puts odd_arr

# 4

ori_arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
ori_arr.push(11)
ori_arr.unshift(0)
puts ori_arr

# 5

ori_arr.pop
ori_arr.push(3)
puts ori_arr

# 6

ori_arr.uniq!
puts ori_arr

# 8
hash1 = Hash.new('hi')
hash2 = {
  bananas: "nice",
  lemons: "not nice",
  :durian => "best"
}

puts hash1
puts hash2

# 9
h = {a:1, b:2, c:3, d:4}
puts h[:b]
h[:e] = 5
h.delete_if {|k, v| v < 3.5}

# 12 

contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
            ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]

contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}

# contacts["Joe Smith"] = contact_data[0]
# contacts["Sally Johnson"] = contact_data[1]
contacts["Joe Smith"][:email] = contact_data[0][0]
contacts["Joe Smith"][:address] = contact_data[0][1]
contacts["Joe Smith"][:phone] = contact_data[0][2]
contacts["Sally Johnson"][:email] = contact_data[1][0]
contacts["Sally Johnson"][:address] = contact_data[1][1]
contacts["Sally Johnson"][:phone] = contact_data[1][2]
puts contacts

# 13
puts contacts["Joe Smith"][:email]
puts contacts["Sally Johnson"][:phone]

contacts2 = {"Joe Smith" => {}, "Sally Johnson" => {}}

# 14
fields = [:email, :address, :phone]
contacts2.each_with_index do |(name, hash), i|
  fields.each do |x|
    hash[x] = contact_data[i].shift

    # v = {
    #   email: x[0],
    #   address: x[1],
    #   phone: x[2]
    # }
    
    # y[:email] => x[0]
    # y[:address] => x[1]
    # y[:phone] => x[2]
  end
end

puts contacts2

# 15

arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']

arr.delete_if {|x| x.start_with?("s")}

puts arr
arr.delete_if {|x| x.start_with?("s", "w")}
puts arr

# 16
a = ['white snow', 'winter wonderland', 'melting ice',
  'slippery sidewalk', 'salted roads', 'white trees']
b = [] 
a.map do |x|
  b.push(x.split(" ")).flatten!
end
p b

# 16 ans

a = a.map { |pairs| pairs.split }
a = a.flatten
p a


