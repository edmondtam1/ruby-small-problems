# 1

# class Machine
#   def start
#     flip_switch(:on)
#   end

#   def stop
#     flip_switch(:off)
#   end

#   def get_state
#     switch
#   end

#   private

#   def flip_switch(desired_state)
#     self.switch = desired_state
#   end

#   attr_accessor :switch
# end

# # 2 code

# class FixedArray
#   def initialize(size)
#     @array = Array.new(size)
#     # @size = size
#   end

#   def [](num)
#     @array.fetch(num)
#     # if num >= @size
#     #   raise IndexError
#     # else
#     #   @array[num]
#     # end
#   end

#   def []=(index, value)
#     # if index >= @size
#     #   raise IndexError
#     # else
#     #   @array[index] = value
#     # end
#     self[index]
#     @array[index] = value
#   end

#   def to_a
#     @array.clone
#   end

#   def to_s
#     @array.to_s
#   end
# end

# # 2 test

# fixed_array = FixedArray.new(5)
# puts fixed_array[3] == nil
# puts fixed_array.to_a == [nil] * 5

# fixed_array[3] = 'a'
# puts fixed_array[3] == 'a'
# puts fixed_array.to_a == [nil, nil, nil, 'a', nil]

# fixed_array[1] = 'b'
# puts fixed_array[1] == 'b'
# puts fixed_array.to_a == [nil, 'b', nil, 'a', nil]

# fixed_array[1] = 'c'
# puts fixed_array[1] == 'c'
# puts fixed_array.to_a == [nil, 'c', nil, 'a', nil]

# fixed_array[4] = 'd'
# puts fixed_array[4] == 'd'
# puts fixed_array.to_a == [nil, 'c', nil, 'a', 'd']
# puts fixed_array.to_s == '[nil, "c", nil, "a", "d"]'

# puts fixed_array[-1] == 'd'
# puts fixed_array[-4] == 'c'

# begin
#   fixed_array[6]
#   puts false
# rescue IndexError
#   puts true
# end

# begin
#   fixed_array[-7] = 3
#   puts false
# rescue IndexError
#   puts true
# end

# begin
#   fixed_array[7] = 3
#   puts false
# rescue IndexError
#   puts true
# end

# 3

# class Student
#   def initialize(name, year)
#     @name = name
#     @year = year
#   end
# end

# class Graduate < Student
#   def initialize(name, year, parking)
#     super(name, year)
#     @parking = parking
#   end
# end

# class Undergraduate < Student
#   def initialize(name, year)
#     super
#   end
# end

# # 4

# class CircularQueue
#   attr_reader :queue
#   def initialize(size)
#     @queue = [nil] * size
#     @size = size
#     @start = 0
#     @end = 0
#   end

#   # def enqueue(object)
#   #   # if there is an object at @end location
#   #   unless @queue[@end].nil?
#   #     @start = increment(@end)
#   #   end

#   #   @queue[@end] = object
#   #   @end = increment(@end)
#   # end

#   # def dequeue
#   #   object = @queue[@start]
#   #   @queue[@start] = nil
#   #   @start = increment(@start) unless object.nil?
#   #   object
#   # end

#   def enqueue(object)
#     @queue.push(object)
#     @queue.shift
#   end

#   def dequeue
#     position = @queue.find_index {|i| i != nil }
#     return nil if position == nil
#     object = @queue[position]
#     @queue[position] = nil
#     object
#   end

#   private

#   def increment(position)
#     (position + 1) % @queue.size
#   end
# end

# # 4 test

# queue = CircularQueue.new(3)
# puts queue.dequeue == nil

# queue.enqueue(1)
# queue.enqueue(2)
# puts queue.dequeue == 1

# queue.enqueue(3)
# queue.enqueue(4)
# puts queue.dequeue == 2

# queue.enqueue(5)
# queue.enqueue(6)
# queue.enqueue(7)
# puts queue.queue
# puts queue.dequeue == 5
# puts queue.dequeue == 6
# puts queue.dequeue == 7
# puts queue.dequeue == nil

# queue = CircularQueue.new(4)
# puts queue.dequeue == nil

# queue.enqueue(1)
# queue.enqueue(2)
# puts queue.dequeue == 1

# queue.enqueue(3)
# queue.enqueue(4)
# puts queue.dequeue == 2

# queue.enqueue(5)
# queue.enqueue(6)
# queue.enqueue(7)
# puts queue.queue
# puts queue.dequeue == 4
# puts queue.dequeue == 5
# puts queue.dequeue == 6
# puts queue.dequeue == 7
# puts queue.dequeue == nil

# 5 code

# class MinilangRuntimeError < RuntimeError; end
# class BadTokenError < MinilangRuntimeError; end
# class EmptyStackError < MinilangRuntimeError; end

# class Minilang
#   def initialize(commands)
#     @commands = commands.split
#     @stack = []
#     @register = 0
#   end

#   def eval
#     @commands.each do |command|
#       begin
#         case command
#         when 'PUSH'         then push
#         when 'ADD'          then add
#         when 'SUB'          then sub
#         when 'MULT'         then mult
#         when 'DIV'          then div
#         when 'MOD'          then mod
#         when 'POP'          then pop
#         when 'PRINT'        then print
#         when /\A[-+]?\d+\z/ then store(command)
#         else
#           raise BadTokenError, "Invalid token: #{command}"
#         end
#       rescue MinilangRuntimeError => error
#         puts error.message
#         return
#       end
#     end
#   end

#   private

#   def push
#     @stack.push(@register)
#   end

#   def add
#     @register = @register.to_i + @stack.pop.to_i
#   end

#   def sub
#     @register = @register.to_i - @stack.pop.to_i
#   end

#   def mult
#     @register = @register.to_i * @stack.pop.to_i
#   end

#   def div
#     @register = @register.to_i / @stack.pop.to_i
#   end

#   def mod
#     @register = @register.to_i % @stack.pop.to_i
#   end

#   def pop
#     raise EmptyStackError, "Empty stack!" if @stack.empty?
#     @register = @stack.pop
#   end

#   def print
#     puts @register != nil ? @register : 'Nope!'
#   end

#   def store(number)
#     @register = number
#   end

#   # def command_error(command)
#   #   begin
#   #     raise "Invalid token: #{command}"
#   #   rescue => e
#   #     puts e.message
#   #   end
#   # end

#   def number?(value)
#     value.to_i.to_s == value
#   end
# end

# # 5 test

# Minilang.new('PRINT').eval
# # 0

# Minilang.new('5 PUSH 3 MULT PRINT').eval
# # 15

# Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# # 5
# # 3
# # 8

# Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# # 10
# # 5

# Minilang.new('5 PUSH POP POP PRINT').eval
# # Empty stack!

# Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# # 6

# Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# # 12

# Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# # Invalid token: XSUB

# Minilang.new('-3 PUSH 5 SUB PRINT').eval
# # 8

# Minilang.new('6 PUSH').eval
# # (nothing printed; no PRINT commands)

# # AREA_OF_A_RECTANGLE = '%<length>d PUSH %<width>d MULT PRINT'
# # minilang2 = Minilang.new(AREA_OF_A_RECTANGLE)
# # minilang2.eval(length: 5, width: 4)

# 6 onwards


# class GuessingGame
#   def initialize(low, high)
#     @answer = rand(@range)
#     @range = low..high
#     @guesses = Math.log2(@range.size).to_i + 1
#     @guess = nil
#     @correct_guess = false
#   end

#   def play
#     reset
#     loop do
#       guesses_remaining
#       enter_guess
#       analyse_guess
#       break if @correct_guess || no_more_guesses
#     end
#     final_message
#   end

#   private

#   def reset
#     initialize(@range.first, @range.last)
#   end

#   def guesses_remaining
#     puts
#     if @guesses == 1
#       puts "You have 1 guess remaining."
#     else
#       puts "You have #{@guesses} guesses remaining."
#     end
#   end

#   def enter_guess
#     @guesses -= 1
#     loop do
#       puts "Enter a number between #{@range.first} and #{@range.last}: "
#       @guess = gets.chomp.to_i
#       break if valid?
#       print "Invalid guess. "
#     end
#   end

#   def valid?
#     @guess.to_s.to_i == @guess &&
#     @guess <= @range.last      &&
#     @guess >= @range.first
#   end

#   def analyse_guess
#     if @guess > @answer
#       puts "Your guess is too high."
#     elsif @guess < @answer
#       puts "Your guess is too low."
#     elsif @guess == @answer
#       @correct_guess = true
#     end
#   end

#   def no_more_guesses
#     @guesses == 0
#   end

#   def final_message
#     puts @correct_guess ? "You won!" : "You have no more guesses. You lost!"
#   end

# end


# game = GuessingGame.new(12345,54321)
# game.play
# game.play
# game.play

# You have 7 guesses remaining.
# Enter a number between 1 and 100: 104
# Invalid guess. Enter a number between 1 and 100: 50
# Your guess is too low.

# You have 6 guesses remaining.
# Enter a number between 1 and 100: 75
# Your guess is too low.

# You have 5 guesses remaining.
# Enter a number between 1 and 100: 85
# Your guess is too high.

# You have 4 guesses remaining.
# Enter a number between 1 and 100: 0
# Invalid guess. Enter a number between 1 and 100: 80

# You have 3 guesses remaining.
# Enter a number between 1 and 100: 81
# That's the number!

# You won!

# game.play

# You have 7 guesses remaining.
# Enter a number between 1 and 100: 50
# Your guess is too high.

# You have 6 guesses remaining.
# Enter a number between 1 and 100: 25
# Your guess is too low.

# You have 5 guesses remaining.
# Enter a number between 1 and 100: 37
# Your guess is too high.

# You have 4 guesses remaining.
# Enter a number between 1 and 100: 31
# Your guess is too low.

# You have 3 guesses remaining.
# Enter a number between 1 and 100: 34
# Your guess is too high.

# You have 2 guesses remaining.
# Enter a number between 1 and 100: 32
# Your guess is too low.

# You have 1 guesses remaining.
# Enter a number between 1 and 100: 32
# Your guess is too low.

# You have no more guesses. You lost!

class Deck
  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

  def initialize
    reset
  end

  def draw
    reset if @deck.empty?
    @deck.pop
  end

  def reset
    @deck = RANKS.product(SUITS).map do |card|
      Card.new(card[0], card[1])
    end.shuffle
  end
end

class Card
  include Comparable

  attr_reader :rank, :suit

  RANK = {
    'Jack' => 11,
    'Queen' => 12,
    'King' => 13,
    'Ace' => 14
  }

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def to_s
    "#{@rank} of #{@suit}"
  end

  def <=>(other)
    value <=> other.value
  end

  def value
    RANK.fetch(@rank, @rank)
  end
end

class PokerHand
  def initialize(deck)
    @hand = []
    @rank_count = Hash.new(0)
    @suits = []
    5.times do |_|
       card = deck.draw
       @hand << card
       @suits.push(card.suit)
       @rank_count[card.value] += 1
    end
  end

  def print
    puts @hand
  end

  def evaluate
    case
    when royal_flush?     then 'Royal flush'
    when straight_flush?  then 'Straight flush'
    when four_of_a_kind?  then 'Four of a kind'
    when full_house?      then 'Full house'
    when flush?           then 'Flush'
    when straight?        then 'Straight'
    when three_of_a_kind? then 'Three of a kind'
    when two_pair?        then 'Two pair'
    when pair?            then 'Pair'
    else                       'High card'
    end
  end

  private

  def royal_flush?
   return false if @rank_count.any? { |_, v| v > 1 }
   @hand.min.value == 10 && straight? && flush?
  end

  def straight_flush?
    straight? && flush?
  end

  def four_of_a_kind?
    n_of_a_kind?(4)
  end

  def full_house?
    n_of_a_kind?(3) && n_of_a_kind?(2)
  end

  def flush?
    @suits.uniq.size == 1
  end

  def straight?
    return false if @rank_count.any? { |_, v| v > 1 }

    @hand.min.value == @hand.max.value - 4
  end

  def three_of_a_kind?
    n_of_a_kind?(3) && !n_of_a_kind?(2)

  end

  def two_pair?
    @rank_count.select { |_, count| count == 2 }.size == 2
  end

  def pair?
    n_of_a_kind?(2)
  end

  def n_of_a_kind?(number)
    @rank_count.one? { |_, count| count == number }
  end
end

# PokerHand test code

hand = PokerHand.new(Deck.new)
hand.print
puts hand.evaluate

# Danger danger danger: monkey
# patching for testing purposes.
class Array
  alias_method :draw, :pop
end

# Test that we can identify each PokerHand type.
hand = PokerHand.new([
  Card.new(10,      'Hearts'),
  Card.new('Ace',   'Hearts'),
  Card.new('Queen', 'Hearts'),
  Card.new('King',  'Hearts'),
  Card.new('Jack',  'Hearts')
])
puts hand.evaluate == 'Royal flush'

hand = PokerHand.new([
  Card.new(8,       'Clubs'),
  Card.new(9,       'Clubs'),
  Card.new('Queen', 'Clubs'),
  Card.new(10,      'Clubs'),
  Card.new('Jack',  'Clubs')
])
puts hand.evaluate == 'Straight flush'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Four of a kind'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate == 'Full house'

hand = PokerHand.new([
  Card.new(10, 'Hearts'),
  Card.new('Ace', 'Hearts'),
  Card.new(2, 'Hearts'),
  Card.new('King', 'Hearts'),
  Card.new(3, 'Hearts')
])
puts hand.evaluate == 'Flush'

hand = PokerHand.new([
  Card.new(8,      'Clubs'),
  Card.new(9,      'Diamonds'),
  Card.new(10,     'Clubs'),
  Card.new(7,      'Hearts'),
  Card.new('Jack', 'Clubs')
])
puts hand.evaluate == 'Straight'

hand = PokerHand.new([
  Card.new('Queen', 'Clubs'),
  Card.new('King',  'Diamonds'),
  Card.new(10,      'Clubs'),
  Card.new('Ace',   'Hearts'),
  Card.new('Jack',  'Clubs')
])
puts hand.evaluate == 'Straight'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(6, 'Diamonds')
])
puts hand.evaluate == 'Three of a kind'

hand = PokerHand.new([
  Card.new(9, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(8, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate == 'Two pair'

hand = PokerHand.new([
  Card.new(2, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(9, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Pair'

hand = PokerHand.new([
  Card.new(2,      'Hearts'),
  Card.new('King', 'Clubs'),
  Card.new(5,      'Diamonds'),
  Card.new(9,      'Spades'),
  Card.new(3,      'Diamonds')
])
puts hand.evaluate == 'High card'


# cards = [Card.new(2, 'Hearts'),
#          Card.new(10, 'Diamonds'),
#          Card.new('Ace', 'Clubs')]
# puts cards
# puts cards.min == Card.new(2, 'Hearts')
# puts cards.max == Card.new('Ace', 'Clubs')

# cards = [Card.new(5, 'Hearts')]
# puts cards.min == Card.new(5, 'Hearts')
# puts cards.max == Card.new(5, 'Hearts')

# cards = [Card.new(4, 'Hearts'),
#          Card.new(4, 'Diamonds'),
#          Card.new(10, 'Clubs')]
# puts cards.min.rank == 4
# puts cards.max == Card.new(10, 'Clubs')

# cards = [Card.new(7, 'Diamonds'),
#          Card.new('Jack', 'Diamonds'),
#          Card.new('Jack', 'Spades')]
# puts cards.min == Card.new(7, 'Diamonds')
# puts cards.max.rank == 'Jack'

# cards = [Card.new(8, 'Diamonds'),
#          Card.new(8, 'Clubs'),
#          Card.new(8, 'Spades')]
# puts cards.min.rank == 8
# puts cards.max.rank == 8

# deck = Deck.new
# drawn = []
# 52.times { drawn << deck.draw }
# p drawn.count { |card| card.rank == 5 } == 4
# p drawn.count { |card| card.suit == 'Hearts' } == 13

# drawn2 = []
# 52.times { drawn2 << deck.draw }
# p drawn != drawn2 # Almost always.

# Include Card and Deck classes from the last two exercises.
