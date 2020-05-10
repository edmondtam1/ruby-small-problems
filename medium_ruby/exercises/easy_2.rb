

# 2

# module Drivable
#   def drive
#   end
# end

# class Car
#   include Drivable
# end

# bobs_car = Car.new
# bobs_car.drive

# # 3

# class House
#   attr_reader :price
#   include Comparable

#   def initialize(price)
#     @price = price
#   end

#   def <=>(other)
#     price <=> other.price
#   end
# end


# home1 = House.new(100_000)
# home2 = House.new(150_000)
# puts "Home 1 is cheaper" if home1 < home2
# puts "Home 2 is more expensive" if home2 > home1

# 3

# class Transform
#   def initialize(text)
#     @text = text
#   end

#   def uppercase
#     @text.upcase
#   end

#   def self.lowercase(text)
#     text.downcase  
#   end
# end

# my_data = Transform.new('abc')
# puts my_data.uppercase
# puts Transform.lowercase('XYZ')

# 4

# 5

# class Wallet
#   include Comparable

#   def initialize(amount)
#     @amount = amount
#   end

#   def <=>(other_wallet)
#     @amount <=> other_wallet.amount
#   end

#   protected

#   def amount
#     @amount
#   end
# end

# bills_wallet = Wallet.new(500)
# pennys_wallet = Wallet.new(465)
# if bills_wallet > pennys_wallet
#   puts 'Bill has more money than Penny'
# elsif bills_wallet < pennys_wallet
#   puts 'Penny has more money than Bill'
# else
#   puts 'Bill and Penny have the same amount of money.'
# end

# 6

# class Pet
#   attr_reader :species, :name

#   def initialize(species, name)
#     @species = species
#     @name = name
#   end
# end

# class Owner
#   attr_reader :name

#   def initialize(name)
#     @name = name
#     @pets = []
#   end

#   def to_s
#     @name
#   end

#   def add_pet(pet)
#     @pets << pet
#   end

#   def number_of_pets
#     @pets.size
#   end

#   def print_pets
#     @pets.each do |pet|
#       puts "a #{pet.species} named #{pet.name}"
#     end
#   end
# end

# class Shelter
#   def initialize()
#     @pairings = {}
#     @pets = []
#   end

#   def adopt(owner, pet)
#     owner.add_pet(pet)
#     @pairings[owner.name] ||= owner
#   end

#   def add_new_pet(pet)
#     @pets << pet
#   end
  
#   def print_adoptions
#     @pairings.each do |name, owner|
#       puts "#{name} has adopted the following pets:"
#       owner.print_pets
#       puts
#     end
#   end

#   def print_available_pets
#     puts "The Animal Shelter has the following unadopted pets:"
#     @pets.each do |pet|
#       puts "a #{pet.species} named #{pet.name}"
#     end
#     puts
#   end
# end

# butterscotch = Pet.new('cat', 'Butterscotch')
# pudding      = Pet.new('cat', 'Pudding')
# darwin       = Pet.new('bearded dragon', 'Darwin')
# kennedy      = Pet.new('dog', 'Kennedy')
# sweetie      = Pet.new('parakeet', 'Sweetie Pie')
# molly        = Pet.new('dog', 'Molly')
# chester      = Pet.new('fish', 'Chester')
# buttercup    = Pet.new('plant', 'Buttercup')
# jessica      = Pet.new('plant', 'Jessica')
# gabby        = Pet.new('plant', 'Gabby')
# pippa        = Pet.new('plant', 'Pippa')

# phanson        = Owner.new('P Hanson')
# bholmes        = Owner.new('B Holmes')
# lamseru        = Owner.new('Lamseru')

# shelter = Shelter.new
# shelter.adopt(phanson, butterscotch)
# shelter.adopt(phanson, pudding)
# shelter.adopt(phanson, darwin)
# shelter.adopt(bholmes, kennedy)
# shelter.adopt(bholmes, sweetie)
# shelter.adopt(bholmes, molly)
# shelter.adopt(bholmes, chester)
# shelter.adopt(lamseru, buttercup)
# shelter.add_new_pet(jessica)
# shelter.add_new_pet(gabby)
# shelter.add_new_pet(pippa)
# shelter.print_adoptions
# shelter.print_available_pets
# puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
# puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."
# puts "#{lamseru.name} has #{lamseru.number_of_pets} adopted pets."

# P Hanson has adopted the following pets:
# a cat named Butterscotch
# a cat named Pudding
# a bearded dragon named Darwin

# B Holmes has adopted the following pets:
# a dog named Molly
# a parakeet named Sweetie Pie
# a dog named Kennedy
# a fish named Chester

# P Hanson has 3 adopted pets.
# B Holmes has 4 adopted pets.

# 7

# class Expander
#   def initialize(string)
#     @string = string
#   end

#   def to_s
#     expand(3)
#   end

#   private

#   def expand(n)
#     @string * n
#   end
# end

# expander = Expander.new('xyz')
# puts expander

# 8 - use a module instead!

module Walkable
  def walk
    puts "#{self} #{gait} forward"
  end
end

class Person
  include Walkable
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def to_s
    name
  end

  private

  def gait
    "strolls"
  end
end

class Cat
  include Walkable
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def to_s
    name
  end

  private

  def gait
    "saunters"
  end
end

class Cheetah
  include Walkable
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def to_s
    name
  end
  
  private

  def gait
    "runs"
  end
end

class Noble
  include Walkable
  attr_reader :name, :title

  def initialize(name, title)
    @name = name
    @title = title
  end

  def to_s
    "#{@title} #{@name}"
  end

  def gait
    "struts"
  end
end



mike = Person.new("Mike")
mike.walk
# => "Mike strolls forward"

kitty = Cat.new("Kitty")
kitty.walk
# => "Kitty saunters forward"

flash = Cheetah.new("Flash")
flash.walk
# => "Flash runs forward"

byron = Noble.new("Byron", "Lord")
byron.walk
# => "Lord Byron struts forward"

p byron.name
# => "Byron"
p byron.title
# => "Lord"
