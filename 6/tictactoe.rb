require 'pry'

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINS_NEEDED = 2
GAME_STARTER = 'choose'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +  # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +  # cols
                [[1, 5, 9], [3, 5, 7]]               # diagonals

def prompt(msg)
  puts "=> #{msg}"
end

# Can use rubocop:disable Metrics/MethodLength although not relevant here
# rubocop:disable Metrics/AbcSize
def display_board(brd)
  system 'clear'
  puts "You're a #{PLAYER_MARKER}. Computer is a #{COMPUTER_MARKER}."
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

# Assignment

# 1
def joinor(arr, mid = ', ', last = 'or')
  str = ''
  arr.each_index do |i|
    if i == arr.size - 1
      item = + last + ' ' + arr[i].to_s
      str << item
      break
    end
    item = arr[i].to_s + mid
    str << item
  end
  str
end

# 1

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd), ', ', 'or')})"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice"
  end

  brd[square] = PLAYER_MARKER
end

def find_at_risk_square(line, board, marker)
  if board.values_at(*line).count(marker) == 2
    board.select{|k, v| line.include?(k) && v == INITIAL_MARKER}.keys.first
  else
    nil
  end
end

def computer_places_piece!(brd)
  square = nil
  if brd[5] == INITIAL_MARKER
    return brd[5] = COMPUTER_MARKER
  end

  WINNING_LINES.each do |line|
    # offense first
    square = find_at_risk_square(line, brd, COMPUTER_MARKER)
    break if square
  end
  
  if !square
    WINNING_LINES.each do |line|
      square = find_at_risk_square(line, brd, PLAYER_MARKER)
      break if square
    end
  end

  if !square
    square = empty_squares(brd).sample
  end
  
  brd[square] = COMPUTER_MARKER
end

def place_piece!(brd, player)
  if player == 'player'
    player_places_piece!(brd)
  else
    computer_places_piece!(brd)
  end
end

def alternate_player(player)
  if player == 'player'
    'computer'
  else
    'player'
  end
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def display_score(player_pts, computer_pts)
  prompt "Welcome to tic tac toe! The current score is:"
  prompt "You: #{player_pts}"
  prompt "Computer: #{computer_pts}"
end

def detect_starter(choice)
  case choice
  when 'choose'
    loop do
      prompt "Please select who should go first, player or computer"
      choice = gets.chomp.downcase
      if choice == 'player'
        return 'player'
      elsif choice == 'computer'
        return 'computer'
      else
        prompt "That isn't a valid option. Please select player or computer"
      end
    end    
  when 'player'
    'player'
  when 'computer'
    'computer'
  end
end

loop do
  player_pts = 0
  computer_pts = 0

  current_player = detect_starter(GAME_STARTER)
  loop do
    board = initialize_board
    display_board(board)

    loop do
      display_board(board)
      display_score(player_pts, computer_pts)
      place_piece!(board, current_player)
      current_player = alternate_player(current_player)
      break if someone_won?(board) || board_full?(board)
    end

    if someone_won?(board)
      player_pts += 1 if detect_winner(board) == 'Player'
      computer_pts += 1 if detect_winner(board) == 'Computer'
      prompt "#{detect_winner(board)} won!"
    else
      prompt "It's a tie!"
    end

    display_board(board)
    if player_pts == WINS_NEEDED
      prompt "Congrats! You've won!"
      break
    elsif computer_pts == WINS_NEEDED
      prompt "Sorry, you've lost."
      break
    end
  end
  prompt "Play again? (y or n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thanks for playing tic tac toe!"
