require 'pry'

SUITS = ["C", "D", "H", "S"]
SPECIAL_CARDS = ["A", "K", "Q", "J"]
MAX_POINTS = 21
DEALER_MAX = 17
WIN_CONDITION = 2

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck
  new_deck = []
  SUITS.each do |suit|
    SPECIAL_CARDS.each do |ltr|
      new_deck << suit + ltr
    end
    (2..10).each do |num|
      new_deck << suit + num.to_s
    end
  end
  new_deck.shuffle!
end

def deal_card(deck, hand)
  hand << deck.pop
end

def show_hand(hand, show_all_cards = true)
  hand.each_index do |i|
    if i == 1 && show_all_cards == false
      puts "-XX"
      next
    end
    print "-" + hand[i] if i < hand.size - 1
    puts "-" + hand[i] + "-" if i == hand.size - 1
  end
end

def letter?(str)
  str =~ /[AKQJ]/
end

# rubocop:disable Metrics/MethodLength
def get_score(hand)
  score = 0
  aces = 0
  hand.each do |card|
    card_value = card[1..2]
    if letter?(card_value) == 0
      if card_value == "A"
        score += 11
        aces += 1
      else
        score += 10
      end
    else
      score += card_value.to_i
    end
  end
  while score > MAX_POINTS && aces > 0
    score -= 10
    aces -= 1
  end
  score
end
# rubocop:enable Metrics/MethodLength

def show_score(hand, player = "Player")
  prompt "#{player}'s score is " + get_score(hand).to_s + "." if hand.class == Array
  prompt "#{player}'s score is " + hand.to_s + "." if hand.class == Integer
end

def take_turn_player
  prompt "Would you like to hit or stay? (h or s)"
  action = ''
  loop do
    action = gets.chomp.downcase
    break if action[0] == "h" || action[0] == "s"
    prompt "Please enter a valid option (h or s)."
  end
  action[0]
end

def bust?(score)
  score > MAX_POINTS
end

def get_winner(player_score, computer_score)
  if player_score > computer_score
    :player_won
  elsif computer_score > player_score
    :computer_won
  else
    :tie
  end
end

def show_winner(res)
  case res
  when :player_won
    prompt "You have won!"
  when :computer_won
    prompt "Dealer has won!"
  when :tie
    prompt "It's a tie!"
  end
end

loop do
  prompt "Welcome to 21!"
  player_wins = 0
  computer_wins = 0
  loop do
    loop do
      puts "--------------------------"
      prompt "Your score is: #{player_wins}"
      prompt "Dealer's score is: #{computer_wins}"
      player_hand = []
      computer_hand = []
      deck = initialize_deck
      2.times do
        deal_card(deck, player_hand)
        deal_card(deck, computer_hand)
      end

      player_score = get_score(player_hand)
      computer_score = get_score(computer_hand)
      prompt "Dealer's hand is:"
      show_hand(computer_hand, false)
      loop do
        prompt "Your hand is:"
        show_hand(player_hand)
        show_score(player_score)
        action = take_turn_player
        deal_card(deck, player_hand) if action == "h"
        player_score = get_score(player_hand)
        break if bust?(player_score) || action != "h"
      end

      show_hand(player_hand)
      show_score(player_score)

      if bust?(player_score)
        prompt "You have lost!"
        computer_wins += 1
        break
      else
        prompt "You've chosen to stay!"
      end

      prompt "Dealer's turn now!"
      prompt "Dealer's opening hand is:"
      show_hand(computer_hand)
      show_score(computer_hand, "Dealer")
      while get_score(computer_hand) < DEALER_MAX
        prompt "Dealer hits."
        deal_card(deck, computer_hand)
        show_hand(computer_hand)
        computer_score = get_score(computer_hand)
        show_score(computer_score, "Dealer")
      end

      if bust?(computer_score)
        prompt "Dealer has gone bust."
        player_wins += 1
        break
      end

      result = get_winner(player_score, computer_score)
      show_winner(result)
      if result == :player_won
        player_wins += 1
      elsif result == :computer_won
        computer_wins += 1
      else
      end
    end
    if player_wins >= WIN_CONDITION
      prompt "You've won the game!"
      break
    elsif computer_wins >= WIN_CONDITION
      prompt "Dealer has won the game!"
      break
    end
  end
  puts "--------------------------"
  prompt "Want to play again? (y or n)"
  repeat = gets.chomp.downcase
  break unless repeat[0] == "y"
end

prompt "Thanks for playing 21!"
