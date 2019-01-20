# # # # # # class Hello
# # # # # #   def speak(other)
# # # # # #     p self.these_words == other.these_words
# # # # # #     p those_words
# # # # # #   end
  
# # # # # #   protected
# # # # # #   def these_words
# # # # # #     'are these'
# # # # # #   end

# # # # # #   private
# # # # # #   def those_words
# # # # # #     'are those'
# # # # # #   end
  
# # # # # # end

# # # # # # hey = Hello.new
# # # # # # hi = Hello.new
# # # # # # hi.speak(hey)

# # # # # # p Class.superclass
# # # # # # p Module.superclass

# # # # # module Aquatic
# # # # # end

# # # # # module Predatory
# # # # # end

# # # # # module Toothed
# # # # # end

# # # # # class Animal
# # # # # end

# # # # # class Mammal < Animal
# # # # # end

# # # # # class Whale < Mammal
# # # # #   include Aquatic
# # # # #   include Predatory
# # # # # end

# # # # # class Orca < Whale
# # # # #   include Toothed
# # # # # end

# # # # # willy = Orca.new
# # # # # p Orca.ancestors

# # # # # 9

# # # # class Person
# # # #   attr_accessor :name

# # # #   def initialize(n)
# # # #     @name = n
# # # #   end

# # # #   def change_info(new_name)
# # # #     self.name = new_name         # invoking the setter method
# # # #   end
# # # # end

# # # # bob = Person.new('bob')
# # # # bob.change_info('Robert')

# # # # puts bob.name

# # # # 10

# # # class Person
# # #   attr_accessor :name, :weight, :height

# # #   @@number_of_persons = 0

# # #   def initialize(name, weight, height)
# # #     @name = name
# # #     @weight = weight
# # #     @height = height
# # #     @@number_of_persons += 1
# # #   end

# # #   def change_info(name, weight, height)
# # #     self.name = name
# # #     self.weight = weight
# # #     self.height = height
# # #   end

# # #   def self.total_people
# # #     @@number_of_persons
# # #   end
# # # end

# # # bob = Person.new('bob', 185, 70)
# # # # p Person.total_people       # this should return 1
# # # bob.change_info('asdf', 35, 234)
# # # p bob.name

# # class Student
# #   attr_reader :name, :grade
# #   def initialize(name, grade)
# #     @name = name
# #     @grade = grade
# #   end

# #   def ==(other)
# #     self.name == other.name &&
# #     self.grade == other.grade
# #   end
# # end

# # bob1 = Student.new('Bob', 12)
# # bob2 = Student.new('Bob', 12)
# # puts bob1 == bob2             # => false
# # p bob1.object_id
# # p bob2.object_id

# # 16

# class Employee
#   def initialize(name, serial_number)
#     @name = name
#     @serial_number = serial_number
#   end

#   def to_s
#     "Name: #{@name}\n"\
#     "Type: #{@type}\n"\
#     "Serial number: #{@serial_number}\n"\
#     "Vacation days: #{@vacation_days}\n"\
#     "Desk: #{@desk}\n"
#   end
# end

# module Vacationable
#   def take_vacation(number_of_days)
#     @vacation_days -= number_of_days
#   end
# end

# module Delegatable
#   def delegate; end
# end

# class Executive < Employee
#   include Vacationable, Delegatable

#   def initialize(name, serial_number)
#     super
#     @vacation_days = 20
#     @desk = 'corner office'
#     @type = 'Executive'
#   end
# end

# class Manager < Employee
#   include Vacationable, Delegatable

#   def initialize(name, serial_number)
#     super
#     @vacation_days = 14
#     @desk = 'regular private office'
#     @type = 'Manager'
#   end
# end

# class RegularEmployee < Employee
#   include Vacationable

#   def initialize(name, serial_number)
#     super
#     @vacation_days = 10
#     @desk = 'cubicle farm'
#     @type = 'Regular employee'
#   end
# end

# class PartTimeEmployee < Employee
#   def initialize(name, serial_number)
#     super
#     @vacation_days = 0
#     @desk = 'open workspace'
#     @type = 'Part-time employee'
#   end
# end

# exec1 = Executive.new('bad', 1234)
# manager = Manager.new('hello', 34234)
# reg = RegularEmployee.new('asdf', 3485)
# part = PartTimeEmployee.new('asdflkj', 59382)
# puts exec1
# puts manager
# puts reg
# puts part

# practise work at https://www.codequizzes.com/ruby/intermediate/object-oriented-design

# class Person
#   def initialize(args)
#     @name = args.fetch(:name)
#     @age = args.fetch(:age)
#   end
# end

# class Hockey
#   attr_reader :great_one
#   def initialize(great_one)
#     @great_one = great_one
#   end
# end

# p Hockey.new({ age: 52, name: "Gretzky" })

module MathHelpers
  def exponent(number, exponent)
    return(number ** exponent)
  end
end

class Calculator
  include MathHelpers

  def square_root(number)
    return(exponent(number, 0.5))
  end
end

c = Calculator.new
p c.square_root(4)
p c.square_root(5)
