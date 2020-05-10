# Description

# Twenty-One is a card game consisting of a dealer and a player, where
# participants try to get as close to 21 as possible without going over

# Players are first dealt 2 cards from a 52-card deck
# The player takes the first turn, and can 'hit' or 'stay'
# If the player busts, he loses. IF he stays, it's the dealer's turn
# The dealer must hit until his cards add up to at least 17
# If he busts, the player wins. If both player and dealer stays, then
# the highest total wins
# If both totals are equal, then it's a tie and nobody wins.

class Participant
  MAX_SCORE = 21
  attr_accessor :hand

  def initialize(deck)
    @hand = []
    @deck = deck
  end

  def deal
    @hand << @deck.deal
  end
  # what goes in here? all the redundant behaviors from Player and Dealer?

  def total
    total = 0
    aces = 0
    @hand.each do |card|
      case card[0]
      when 2..10 then total += card[0]
      when 'A' then aces += 1
      else total += 10
      end
    end
    total += add_aces(total, aces)
    total
  end

  def add_aces(total, aces)
    ace_total = 0
    1.upto(aces) do |_|
      ace_total += if total + 11 <= MAX_SCORE
                     11
                   else
                     1
                   end
    end
    ace_total
  end

  def busted?
    total > MAX_SCORE
  end

  def >(other_player)
    total > other_player.total
  end
end

class Player < Participant
  def hit
    deal
    puts "You hit!"
  end

  def stay
    puts "stay"
  end
end

class Dealer < Participant
  DEALER_THRESHOLD = 17

  def hit
    deal
    puts "Dealer hits!"
  end

  def meets_threshold
    total > DEALER_THRESHOLD
  end
end

class Deck
  SUITS = ['C', 'D', 'H', 'S'].freeze
  CARDS = ((2..10).to_a + ['J', 'Q', 'K', 'A']).freeze
  DECK = CARDS.product(SUITS)

  attr_reader :deck

  def initialize
    @deck = DECK.clone.shuffle
    # obviously, we need some data structure to keep track of cards
    # array, hash, something else?
  end

  def deal
    @deck.pop
  end

  def reset_deck
    @deck = DECK.clone.shuffle
  end
end

class Card
  def initialize
    # what are the "states" of a card?
  end
end

module Displayable
  def display_cards(hand)
    print '-'
    0.upto(hand.size - 1) do |num|
      print hand[num].join
      print '-'
    end
    puts ''
  end

  def display_welcome_message
    puts "Welcome to 21!"
  end

  def display_player_cards
    puts "Your hand is:"
    display_cards(@human.hand)
  end

  def display_computer_cards
    puts "The dealer's hand is:"
    display_cards(@computer.hand)
  end

  def display_initial_cards
    display_player_cards
    display_computer_cards
  end

  def display_score
    puts "Your score is #{@human.total}."
    puts "Dealer's score is #{@computer.total}."
  end

  def display_player_bust_message
    puts "Sorry, you've gone bust!"
  end

  def display_computer_bust_message
    puts "Dealer has gone bust. You win!"
  end

  def display_result
    display_score
    if @human > @computer
      puts "You won!"
    elsif @computer > @human
      puts "Dealer won :("
    else
      puts "It's a tie!"
    end
  end
end

class Game
  include Displayable

  def initialize
    @deck = Deck.new
    @human = Player.new(@deck)
    @computer = Dealer.new(@deck)
  end

  def start
    display_welcome_message
    loop do
      deal_initial_cards
      display_initial_cards
      display_score
      game_loop
      break unless play_again?
      reset_game
    end
    display_goodbye_message
  end

  def game_loop
    loop do
      player_turn
      if @human.busted?
        display_player_bust_message
        break
      end
      dealer_turn
      if @computer.busted?
        display_computer_bust_message
        break
      end
      display_result
      break
    end
  end

  def deal_initial_cards
    2.times do |_|
      @human.deal
      @computer.deal
    end
  end

  def player_action
    ans = nil
    loop do
      ans = gets.chomp.downcase[0]
      break if valid_command?(ans)
      puts "Please enter a valid entry - either h or s!"
    end
    ans
  end

  def player_turn
    loop do
      puts "Would you like to hit or stay? (h or s)"
      break if player_action == 's'
      clear
      @human.hit
      display_player_cards
      display_score
      break if @human.busted?
    end
  end

  def dealer_turn
    loop do
      return if @computer.meets_threshold || @computer > @human
      @computer.hit
      display_computer_cards
    end
  end

  def clear
    system('clear') || system('cls')
  end

  def valid_command?(str)
    ['h', 's'].include? str
  end

  def play_again?
    answer = nil
    loop do
      puts 'Would you like to play again? (y/n)'
      answer = gets.chomp.downcase[0]
      break if %w[y n].include? answer
      puts 'Sorry, must be y or n.'
    end
    answer == 'y'
  end

  def reset_game
    @human.hand = []
    @computer.hand = []
    @deck.reset_deck
    clear
  end

  def display_goodbye_message
    puts "Thanks for playing 21. Goodbye!"
  end
end

Game.new.start
# p Deck.new.deck
