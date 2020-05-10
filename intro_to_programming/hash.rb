# iterating over hashes
person = {name: 'bob', height: '6 ft', weight: '160 lbs', hair: 'brown'}

person.each do |key, value|
  puts "Bob's #{key} is #{value}"
end

def greeting(name, options = {})
  if options.empty?
    puts "Hi, my name is #{name}"
  else
    puts "Hi, my name is #{name} and I'm #{options[:age]}" +
         " years old and I live in #{options[:city]}."
  end
end

greeting("Bob")
greeting("Bob", {age: 62, city: "New York City"})
greeting("Bob", age: 6, city: "my house")

h = { "a" => 100, "b" => 200 }
h.fetch("c") { |el| puts "go fish, #{el}"} 

# Exercise 1

family = {  uncles: ["bob", "joe", "steve"],
  sisters: ["jane", "jill", "beth"],
  brothers: ["frank","rob","david"],
  aunts: ["mary","sally","susan"]
}

arr = []

family.select do |k, v|
  if k == :sisters || k == :brothers
    arr.push(v)
  end
end

puts arr

# or

imm_fam = family.select do |k, v|
  k == :sisters || k == :brothers
end

p imm_fam.values.flatten

# 2
friends = { close: ["a", "b", "c"],
  distant: ["d", "e", "f"]
}

family.merge(friends)
puts family
family.merge!(friends)
puts family
p family.values.flatten

# 3
p family.keys
family.each_key {|n| puts n}
p family.values
family.each_value {|n| puts n}
family.select do |k, v|
  puts "Hi there your #{k} are comprised of #{v}"
end

# 5
if family.has_value?(["bob", "joe", "steve"])
  puts "yep"
else
  puts "nope"
end

# 6
words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
  'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
  'flow', 'neon']

result = {}

words.select do |word|
  key = word.split('').sort.join
  if result.has_key?(key)
    result[key].push(word)
  else
    result[key] = [word]
  end
end

result.each_value do |v|
  puts "-------"
  p v
end
