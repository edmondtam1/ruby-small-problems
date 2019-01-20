# 1

# class Banner
#   def initialize(message, width = message.length)
#     @message = message
#     @width = width
#   end

#   def to_s
#     [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
#   end

#   private

#   def horizontal_rule
#     dashes = '-' * (@width + 2)
#     "+#{dashes}+"
#   end

#   def empty_line
#     spaces = ' ' * @width
#     "| #{spaces} |"
#   end

#   def message_line
#     height = @width > 0 ? @message.length / @width : 1
#     str = ''
#     1.upto(height + 1) do |i|
#       text = @message[(@width) * (i-1).. (@width) * (i) - 1]
#       new_line = "| #{text.center(@width)} |"
#       str += i != height + 1 ? new_line + "\n" : new_line
#     end
#     str
#   end
# end

# banner = Banner.new('To boldly go where no one has gone before.', 5)
# puts banner
# banner = Banner.new('')
# puts banner
# banner = Banner.new('To boldly go where no one has gone before.', 30)
# puts banner
# banner = Banner.new('To boldly go where no one has gone before.', 2)
# puts banner

# 2

# class Pet
#   attr_reader :name

#   def initialize(name)
#     @name = name.to_s.object_id.to_s
#   end

#   def to_s
#     "My name is #{@name.upcase}."
#   end
# end

# # name = 'Fluffy'
# # fluffy = Pet.new(name)
# # puts fluffy.name
# # puts fluffy
# # puts fluffy.name
# # puts name

# name = 42
# fluffy = Pet.new(name)
# name += 1
# puts fluffy.name
# puts fluffy
# puts fluffy.name
# puts name.object_id

# 3

# class Book
#   attr_reader :author, :title

#   def initialize(author, title)
#     @author = author
#     @title = title
#   end

#   def to_s
#     %("#{title}", by #{author})
#   end
# end

# book = Book.new("Neil Stephenson", "Snow Crash")
# puts %(The author of "#{book.title}" is #{book.author}.)
# puts %(book = #{book}.)

# 4

# class Book
#   attr_accessor :author, :title

#   def to_s
#     %("#{title}", by #{author})
#   end
# end

# book = Book.new
# book.author = "Neil Stephenson"
# book.title = "Snow Crash"
# puts %(The author of "#{book.title}" is #{book.author}.)
# puts %(book = #{book}.)

# 5

# class Person
#   def initialize(first_name, last_name)
#     @first_name = first_name.capitalize
#     @last_name = last_name.capitalize
#   end

#   def first_name=(first_name)
#     @first_name = first_name.capitalize
#   end

#   def last_name=(last_name)
#     @last_name = last_name.capitalize
#   end

#   def to_s
#     "#{@first_name} #{@last_name}"
#   end
# end

# person = Person.new('john', 'doe')
# puts person

# person.first_name = 'jane'
# person.last_name = 'smith'
# puts person

# 6

# class Flight
#   def initialize(flight_number)
#     @database_handle = Database.init
#     @flight_number = flight_number
#   end
# end

# 7

# class Car
#   attr_accessor :mileage

#   def initialize
#     @mileage = 0
#   end

#   def increment_mileage(miles)
#     total = mileage + miles
#     # @mileage = total - not the ideal solution as it bypasses setter
#     self.mileage = total
#   end

#   def print_mileage
#     puts mileage
#   end
# end

# car = Car.new
# car.mileage = 5000
# car.increment_mileage(678)
# car.print_mileage  # should print 5678

# 8

# class Rectangle
#   def initialize(height, width)
#     @height = height
#     @width = width
#   end

#   def area
#     @height * @width
#   end
# end

# class Square < Rectangle
#   def initialize(int)
#     super(int, int)
#   end
# end

# square = Square.new(5)
# puts "area of square = #{square.area}"

# 9

# class Pet
#   def initialize(name, age)
#     @name = name
#     @age = age
#   end
# end

# class Cat < Pet
#   def initialize(name, age, color)
#     super(name, age)
#     @color = color
#   end

#   def to_s
#     "My cat #{@name} is #{@age} years old and has #{@color} fur."
#   end
# end

# pudding = Cat.new('Pudding', 7, 'black and white')
# butterscotch = Cat.new('Butterscotch', 10, 'tan and white')
# puts pudding, butterscotch

# 10

class Vehicle
  attr_reader :make, :model

  def initialize(make, model)
    @make = make
    @model = model
  end

  def to_s
    "#{make} #{model}"
  end
end

class Car < Vehicle
  def wheels
    4
  end
end

class Motorcycle < Vehicle
  def wheels
    2
  end
end

class Truck < Vehicle
  attr_reader :payload

  def initialize(make, model, payload)
    super(make, model)
    @payload = payload
  end

  def wheels
    6
  end
end

