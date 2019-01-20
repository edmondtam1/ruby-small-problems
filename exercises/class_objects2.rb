# 1

# class Cat
#   def self.generic_greeting
#     puts "Hello! I'm a cat!"
#   end
# end

# Cat.generic_greeting
# kitty = Cat.new
# kitty.class.generic_greeting

# # 3

# class Cat
#   COLOR = 'purple'
#   attr_accessor :name

#   @@total = 0

#   def initialize(name)
#     @name = name
#     @@total += 1
#   end

#   def rename(str)
#     self.name = str
#   end

#   def identify
#     self
#   end

#   def self.total
#     @@total
#   end

#   def self.generic_greeting
#     puts "Hello! I'm a #{self.class.to_s.downcase}!"
#   end

#   def personal_greeting
#     puts "Hello! My name is #{name}!"
#   end

#   def greet
#     puts "Hello! My name is #{name} and I'm a #{COLOR} cat!"
#   end

#   def to_s
#     "I'm #{name}!"
#   end
# end

# kitty = Cat.new('Sophie')
# p kitty.name

# Cat.generic_greeting
# kitty.personal_greeting
# p Cat.total
# kitty.greet
# puts kitty

# 8

class Person
  attr_writer :secret

  def compare_secret(other_person)
    secret == other_person.secret
  end

  protected

  attr_reader :secret
end

person1 = Person.new
person1.secret = 'Shh.. this is a secret!'

person2 = Person.new
person2.secret = 'Shh.. this is a different secret!'

puts person1.compare_secret(person2)
