# module Towable
#   def tow
#     puts "I can tow a trailer!"
#   end
# end

# class Vehicle
#   attr_reader :year

#   def initialize(year)
#     @year = year
#   end

#   def start_engine
#     'Ready to go!'
#   end
# end

# class Truck < Vehicle
#   include Towable

#   attr_reader :bed_type

#   def initialize(year, bed_type)
#     super(year)
#     @bed_type = bed_type
#   end

#   def start_engine(speed)
#     "#{super()} Drive #{speed}, please!"
#   end
# end

# class Car < Vehicle
# end

# truck1 = Truck.new(1994, 'Short')
# puts truck1.year
# puts truck1.bed_type
# puts truck1.start_engine('fast')
# truck1.tow

# car1 = Car.new(2006)
# puts car1.year

# next question

# module Towable
#   def tow
#     'I can tow a trailer!'
#   end
# end

# class Vehicle
#   attr_accessor :year

#   def initialize(year)
#     @year = year
#   end
# end

# class Truck < Vehicle
#   include Towable
# end

# class Car < Vehicle
# end

# truck1 = Truck.new(1994)
# puts truck1.year
# puts truck1.tow

# car1 = Car.new(2006)
# puts car1.year

# class Animal
#   attr_reader :color

#   def initialize(color)
#     @color = color
#   end
# end

# class Cat < Animal
# end

# class Bird < Animal
# end

# cat1 = Cat.new('Black')
# p cat1.color
# p Cat.ancestors

module Transportation
  class Vehicle
  end

  class Truck < Vehicle
  end

  class Car < Vehicle
  end
end
