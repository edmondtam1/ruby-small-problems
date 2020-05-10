


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

class Wallet
  include Comparable

  def initialize(amount)
    @amount = amount
  end

  def <=>(other_wallet)
    @amount <=> other_wallet.amount
  end

  protected

  def amount
    @amount
  end
end

bills_wallet = Wallet.new(500)
pennys_wallet = Wallet.new(465)
if bills_wallet > pennys_wallet
  puts 'Bill has more money than Penny'
elsif bills_wallet < pennys_wallet
  puts 'Penny has more money than Bill'
else
  puts 'Bill and Penny have the same amount of money.'
end


