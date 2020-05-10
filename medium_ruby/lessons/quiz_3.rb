# class Thing
#   attr_accessor :size

#   def initialize(s)
#     @size = s
#   end

#   def ==(other_thing)
#     size == other_thing.size
#   end
# end

# p thing1 = Thing.new(5)
# p thing2 = Thing.new(5)
# p thing3 = thing1
# p thing1.size = 4
# p thing1
# p thing2
# p thing3

# 8

# class Circle
#   attr_reader :radius

#   def initialize(r)
#     @radius = r
#   end

#   def >(other)
#     radius > other.radius
#   end

#   def ==(other)
#     radius == other.radius
#   end
# end

# p circle1 = Circle.new(5)
# p circle2 = Circle.new(3)
# p circle3 = Circle.new(5)

# p circle3 != circle2

# 11

# module Speedy
#   attr_accessor :speed
  
#   def run_fast
#     @speed = 70
#   end
# end

# class Animal
#   attr_accessor :name, :age
  
#   def initialize(name, age)
#     @name = name
#     @age = age
#   end
# end

# class Dog < Animal
#   DOG_YEARS = 7

#   def initialize(name, age)
#     @dog_age = age * DOG_YEARS
#   end
# end

# class Greyhound < Dog
#   include Speedy
# end

# grey = Greyhound.new('Grey', 3)
# p grey.name
# p grey.age
# p grey.speed

# 12

# class Shape
#   @@sides = nil

#   def self.sides
#     @@sides
#   end

#   def sides
#     @@sides
#   end
# end

# class Triangle < Shape
#   def initialize
#     @@sides = 3
#   end
# end

# class Quadrilateral < Shape
#   def initialize
#     @@sides = 4
#   end
# end

# quad = Quadrilateral.new
# p tri = Triangle.new.sides
# p tri.sides

# 13

module Describable
  # SIDES = nil
  def describe_shape
    "I am a #{self.class} and have #{self.class::SIDES} sides."
  end
end

class Shape
  include Describable

  def self.sides
    self::SIDES
  end
end

class Quadrilateral < Shape
  SIDES = 4
  def sides; SIDES; end
end

class Square < Quadrilateral; end

p Square.sides # => 4
p Square.new.sides # => 4
p Square.new.describe_shape # => "I am a Square and have 4 sides."
