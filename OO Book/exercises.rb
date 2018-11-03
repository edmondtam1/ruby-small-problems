# module Bananas
#   def test
#     puts 'Tested!'
#   end
# end

# class GoodDog
#   attr_accessor :name, :weight, :height
#   # attr_reader :name => get the instance variable only
#   # attr_writer :name => set the instance variable only
#   @@number_of_dogs = 0
#   include Bananas
#   def initialize(n, h, w)
#     @name = n
#     @height = h
#     @weight = w
#     @@number_of_dogs += 1
#   end

#   def self.what_am_i
#     "I'm a GoodDog class!"
#   end

#   def self.total_number_of_dogs
#     @@number_of_dogs
#   end

#   def speak
#     "#{name} says Arf!"
#   end

#   def change_info(n, h, w)
#     # this appears to be a local variable instantiation
#     # name = n
#     # using self.method refers it specifically to the method name=
#     self.name = n
#     self.height = h
#     self.weight = w
#   end

#   def info
#     # no need for self.method style here, although it will still work
#     "#{name} weighs #{weight} and is #{height} tall."
#   end
# end

# alfred = GoodDog.new('Alfred')
# milo = GoodDog.new('Milo')
# alfred.test
# p alfred.speak
# p milo.speak
# puts alfred.name
# alfred.name = "Alfresco"
# puts alfred.name

# puts GoodDog.total_number_of_dogs

# sparky = GoodDog.new('Sparky', '12 inches', '10 lbs')
# puts sparky.speak
# puts sparky.info      # => Sparky weighs 10 lbs and is 12 inches tall.

# sparky.change_info('Spartacus', '24 inches', '45 lbs')
# puts sparky.speak
# puts sparky.info      # => Spartacus weighs 45 lbs and is 24 inches tall.

# puts GoodDog.total_number_of_dogs
# p GoodDog.what_am_i

# Version 2 below
# ----------------

# class GoodDog
#   DOG_YEARS = 7

#   attr_accessor :name, :age

#   def initialize(n, a)
#     @name = n
#     @age  = a * DOG_YEARS
#   end

#   def to_s
#     "This dog's name is #{name} and it is #{age} in dog years."
#   end
# end

# sparky = GoodDog.new('sparks', 3)
# puts sparky

# # to_s is called when `puts` is used or during string interpolation

# class Animal
#   def a_public_method
#     "Will this work? " + self.a_protected_method
#   end

#   protected

#   def a_protected_method
#     "Yes, I'm protected!"
#   end
# end

# fido = Animal.new
# p fido.a_public_method        # => Will this work? Yes, I'm protected!

# Vehicle class below
# -------------

# class Vehicle
#   attr_accessor :color
#   attr_reader :year, :model

#   @@number_of_vehicles = 0

#   def initialize(y, c, m)
#     @year = y
#     @color = c
#     @model = m
#     @speed = 0
#     @@number_of_vehicles += 1
#   end

#   def self.total_number_of_vehicles
#     @@number_of_vehicles
#   end

#   def self.gas_mileage(g, m)
#     puts "#{m/g} miles per gallon of gas."
#   end

#   def speed_up(num)
#     @speed += num
#     puts "You accelerate and your speed is now #{@speed}."
#   end

#   def brake(num)
#     @speed -= num
#     puts "You brake and your speed is now #{@speed}."
#   end

#   def shut_off
#     @speed = 0
#     puts "You've parked the vehicle!"
#   end

#   def current_speed
#     puts "You're now going at #{@speed}."
#   end

#   def spray_paint(new_color)
#     @color = new_color
#     puts "You new #{color} paint job looks great!"
#   end

#   def age
#     puts "Your vehicle is #{years_old} years old."
#   end

#   private

#   def years_old
#     Time.now.year - @year
#   end
# end

# module Seatable
#   def customize_seats?(str)
#     str == "yes"
#   end
# end

# class MyCar < Vehicle
#   include Seatable
#   NUMBER_OF_DOORS = 4

#   def to_s
#     "My car is a #{year} #{color} #{model}."
#   end
# end

# class MyTruck < Vehicle
#   NUMBER_OF_DOORS = 2

#   def to_s
#     "My truck is a #{year} #{color} #{model}."
#   end
# end

# volvo = MyCar.new(2015, 'red', 'Toyota')
# MyCar.gas_mileage(15, 300)
# volvo.speed_up(20)
# volvo.brake(10)
# volvo.speed_up(30)
# volvo.shut_off
# volvo.current_speed
# volvo.color = 'blue'
# p volvo.color
# p volvo.year
# volvo.spray_paint('yellow')
# p volvo.color
# puts volvo
# new_truck = MyTruck.new(2010, 'blue', 'Ford')
# puts new_truck
# puts Vehicle.total_number_of_vehicles
# p volvo.customize_seats?('yes')

# p MyCar.ancestors
# p MyTruck.ancestors
# p Vehicle.ancestors
# volvo.age

# Student class below
# ---------------

# class Student
#   attr_accessor :name
#   attr_writer :grade

#   def initialize(n, g)
#     @name = n
#     @grade = g
#   end

#   def better_grade_than?(other_student)
#     grade > other_student.grade
#   end

#   protected

#   def grade
#     @grade
#   end
# end

# joe = Student.new('joe', 5)
# bob = Student.new('bob', 4)
# puts 'Well done!' if joe.better_grade_than?(bob)

# class Some
    
#   def initialize
#     method1
#     # self.method1
#     method2
#     self.method2
#   end

#   protected

#   def method2
#     puts "protected method2 called"
#   end

#   private
  
#   def method1
#     puts "private method1 called"  
#   end
         
# end

# s = Some.new
# # s.method1 # leads to an error
# # s.method2 # leads to an error

# class Cat
# end

# whiskers = Cat.new
# ginger = Cat.new
# paws = Cat.new

# p whiskers.object_id
# p paws.object_id

# module Flight
#   def fly; end
# end

# module Aquatic
#   def swim; end
# end

# module Migratory
#   def migrate; end
# end

# class Animal
# end

# class Bird < Animal
# end

# class Penguin < Bird
#   include Aquatic
#   include Migratory
# end

# pingu = Penguin.new
# # pingu.fly
# p Penguin.ancestors

# class Animal
#   def initialize(name)
#     @name = name
#   end

#   def speak
#     puts sound
#   end

#   def sound
#     "#{@name} says "
#   end
# end

# class Cow < Animal
#   def sound
#     super + "moooooooooooo!"
#   end
# end

# daisy = Cow.new("Daisy")
# daisy.speak

# class Person
#   attr_writer :name

#   def name
#     @name
#   end
# end

# kate = Person.new
# kate.name = 'Kate'
# p kate.name # => 'Kate'

# class Person
#   attr_writer :first_name, :last_name

#   def full_name
#     # omitted code
#     # @first_name + ' ' + @last_name
#     # first_name + ' ' + last_name
#     # self.first_name + ' ' + self.last_name
#     "#{@first_name} #{@last_name}"
#   end
# end

# mike = Person.new
# mike.first_name = 'Michael'
# mike.last_name = 'Garcia'
# p mike.full_name # => 'Michael Garcia'

# class Student
#   attr_accessor :name, :grade

#   def initialize(name)
#     @name = name
#     @grade = nil
#   end

#   def change_grade(new_grade)
#     grade = new_grade
#   end
# end

# priya = Student.new("Priya")
# priya.change_grade('A')
# p priya.grade # => "A"

# class MeMyselfAndI
#   p self

#   def self.me
#     self
#   end

#   def myself
#     p self.inspect
#   end

#   p me
# end

# i = MeMyselfAndI.new
# # i.print
# i.myself

# class SecretThing


#   protected

#   def share_secret
#     "The secret is #{self.secret}"
#   end

#   private

#   def secret
#     "shhh.. it's a secret!!"
#   end
# end

# p SecretThing.new.share_secret # => "The secret is shhh.. it's a secret!!"

# class Person
#   attr_accessor :first_name, :last_name
#     def initialize(n)
#   parse_full_name(n)
#     end
  
#     def name
#       "#{first_name} #{last_name}".strip
#     end
  
#     def name= full_name
#   parse_full_name(full_name)
#     end
  
#     # could have combined into a separate method to be DRY
  
#   private
  
#     def parse_full_name(full_name)
#   words = full_name.split
#       self.first_name = words.first
#       self.last_name = words.size > 1 ? words.last : ''
#     end
  
#     def to_s
#   name
#     end
#   end
  
#   # bob = Person.new('Robert')
#   # bob.name # => 'Robert'
#   # bob.first_name # => 'Robert'
#   # p bob.last_name # => ''
#   # p bob.last_name = 'Smith'
#   # p bob.name # => 'Robert Smith'
  
#   p bob = Person.new('Robert')
#   p bob.name # => 'Robert'
#   p bob.first_name # => 'Robert'
#   p bob.last_name # => ''
#   p bob.last_name = 'Smith'
#   p bob.name # => 'Robert Smith'
  
#   p bob.name = "John Adams"
#   p bob.first_name # => 'John'
#   p bob.last_name # => 'Adams'
  
#   bob = Person.new('Robert Smith')
#   rob = Person.new('Robert Smith')
  
#   p bob.name == rob.name
#   puts "The person's name is: #{bob}"
  
#   # lesson on inheritance - recommended answer
  
#   class Pet
#     def run
#       'running!'
#     end
  
#     def jump
#       'jumping!'
#     end
#   end
  
#   class Dog < Pet
#     def speak
#       'bark!'
#     end
  
#     def fetch
#       'fetching!'
#     end
  
#     def swim
#       'swimming!'
#     end
#   end
  
#   class Cat < Pet
#     def speak
#       'meow!'
#     end
#   end
  
#   class Bulldog < Dog
#     def swim
#       "can't swim!"
#     end
#   end
  
#   pete = Pet.new
#   kitty = Cat.new
#   dave = Dog.new
#   bud = Bulldog.new
  
#   pete.run # => "running!"
#   # pete.speak # => NoMethodError
  
#   kitty.run # => "running!"
#   kitty.speak # => "meow!"
#   # kitty.fetch # => NoMethodError
  
#   dave.speak # => "bark!"
  
#   bud.run # => "running!"
#   bud.swim # => "can't swim!"
  
#   # inheritance - my answer using modules
  
  
  
#   module Movable
#     def speak
#       'bark!'
#     end
      
#     def run
#       'running!'
#     end
  
#     def jump
#       'jumping!'
#     end
#   end
  
#   class Dog
#   include Movable
  
#     def swim
#       'swimming!'
#     end
  
#     def fetch
#       'fetching!'
#     end
#   end
  
#   class Cat
#   include Movable
#     def speak
#       'meow!'
#     end
#   end
  
#   class Bulldog < Dog
#     def swim
#       "can't swim!"
#     end
#   end
  
  
  # ---------
  # RPS
  
  
  
 
  
  