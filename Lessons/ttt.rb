require 'io/console'
require 'pry'

# TTT game using OO principles
class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                  [[1, 5, 9], [3, 5, 7]]              # diagonals

  def initialize
    @squares = {}
    reset_game
  end

  def [](num)
    @squares[num]
  end

  def []=(num, marker)
    @squares[num].marker = marker
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winning_marker
  end

  # return winning marker or nil
  def winning_marker
    WINNING_LINES.each do |line|
      markers = @squares.values_at(*line).collect(&:marker)
      if markers.uniq == [markers[0]] && markers[0] != Square::INITIAL_MARKER
        return markers[0]
      end
    end
    nil
  end

  def integer?(str)
    str.to_s == str.to_i.to_s
  end

  def find_at_risk_square(player_marker)
    WINNING_LINES.each do |line|
      mapped_line = line.map do |num|
        if @squares[num].marker == Square::INITIAL_MARKER
          num
        else
          @squares[num].marker
        end
      end
      if mapped_line.count(player_marker) == 2
        arr = mapped_line.select { |k| integer?(k) }
        return arr[0] if integer?(arr[0])
      end
    end
    nil
  end

  def reset_game
    (1..9).each { |key| @squares[key] = Square.new }
  end

  # rubocop:disable Metrics/AbcSize
  def draw
    puts "     |     |"
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}"
    puts "     |     |"
  end
end
# rubocop:enable Metrics/AbcSize

class Square
  INITIAL_MARKER = " "

  attr_accessor :marker

  def initialize(marker = INITIAL_MARKER)
    @marker = marker
  end

  def to_s
    @marker
  end

  def unmarked?
    marker == INITIAL_MARKER
  end
end

# Defines Player class
class Player
  attr_accessor :marker, :name

  def initialize
    @marker = nil
    @name = nil
  end
end

module Displayable
  def display_welcome_message
    puts "Welcome to Tic Tac Toe, #{human.name}!"
    puts "You are competing against #{computer.name}."
    puts "First to #{TTTGame::SCORE_TO_WIN} wins!"
    puts ''
  end

  def display_goodbye_message
    puts "Thanks for playing Tic Tac Toe, #{human.name}! Goodbye!"
  end

  def display_board
    puts "Current score is #{@score[:human_score]}-#{@score[:computer_score]}"
    puts "You're #{human.marker}. #{computer.name} is #{computer.marker}."
    puts ''
    board.draw
    puts ''
  end

  def display_overall_winner
    human_score = @score[:human_score]
    computer_score = @score[:computer_score]
    if human_score >= TTTGame::SCORE_TO_WIN
      puts "You've won #{human_score} to #{computer_score} overall!"
    else
      puts "You've lost #{human_score} to #{computer_score} overall."
    end
  end

  def clear_screen_and_display_board
    clear
    display_board
  end

  def display_play_again_message
    puts "Let's play again, #{human.name}!"
    puts ''
  end

  def display_end_message
    puts '-----------------------'
    return if overall_winner?
    puts 'Press any key to play the next round.'
    STDIN.getch
  end
end

# Defines Game class
class TTTGame
  include Displayable

  MARKER_OPTIONS = ['X', 'O']
  FIRST_MOVER = 'X'
  CENTER_TILE = 5
  SCORE_TO_WIN = 2

  attr_reader :board, :human, :computer, :current_mover

  def initialize
    @board = Board.new
    @human = Player.new
    @computer = Player.new
    @current_mover = FIRST_MOVER
    @score = { human_score: 0, computer_score: 0 }
  end

  def play
    pre_game
    loop do
      loop do
        game_loop
        break if overall_winner?
        reset_game
      end
      display_overall_winner
      break unless play_again?
      reset_score_and_game
      display_play_again_message
    end
    display_goodbye_message
  end

  private

  def pre_game
    clear
    choose_human_name
    choose_computer_name
    display_welcome_message
    choose_marker
    display_board
  end

  def choose_marker
    puts 'Please choose a marker you want: (X or O)'
    human_marker = nil
    loop do
      human_marker = gets.chomp.upcase
      break if MARKER_OPTIONS.include? human_marker
      puts 'Invalid entry! Please enter X or O only.'
    end
    @human.marker = human_marker
    @computer.marker = MARKER_OPTIONS.reject { |v| v == human_marker }.first
  end

  def choose_human_name
    puts "What is your name?"
    human_name = nil
    loop do
      human_name = gets.chomp
      break if valid_name(human_name)
      puts 'Invalid entry! Please key in non-space characters.'
    end
    @human.name = human_name
  end

  def valid_name(str)
    str.chars.none? { |k| k == ' ' } && !str.empty?
  end

  def choose_computer_name
    @computer.name = ['R2D2', 'Hal', 'Sonny'].sample
  end

  def game_loop
    loop do
      current_player_moves
      break if board.someone_won? || board.full?
      clear_screen_and_display_board
    end
    display_and_update_result
  end

  def overall_winner?
    @score[:human_score] >= SCORE_TO_WIN ||
      @score[:computer_score] >= SCORE_TO_WIN
  end

  def joinor(arr, separator = ', ', last_word = 'or')
    str = ''
    0.upto(arr.size - 2) do |i|
      str += arr[i].to_s + separator
    end
    str += last_word + ' ' + arr[-1].to_s
  end

  def human_moves
    puts "Choose a square between (#{joinor(board.unmarked_keys)}): "
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts 'Sorry, not a valid choice!'
    end
    board[square] = human.marker
  end

  def computer_decision(attack, defend)
    if attack
      board[attack] = computer.marker
    elsif defend
      board[defend] = computer.marker
    else
      board[board.unmarked_keys.sample] = computer.marker
    end
  end

  def computer_moves
    attack_square = board.find_at_risk_square(computer.marker)
    defend_square = board.find_at_risk_square(human.marker)
    if board[CENTER_TILE].marker == Square::INITIAL_MARKER
      board[CENTER_TILE] = computer.marker
    else
      computer_decision(attack_square, defend_square)
    end
  end

  def human_turn?
    @current_mover == human.marker
  end

  def current_player_moves
    if human_turn?
      @current_mover = computer.marker
      human_moves
    else
      @current_mover = human.marker
      computer_moves
    end
  end

  def display_and_update_result
    display_board
    case board.winning_marker
    when human.marker
      @score[:human_score] += 1
      puts 'You won this round!'
    when computer.marker
      @score[:computer_score] += 1
      puts 'Computer won the round :('
    else
      puts "It's a tie!"
    end
    display_end_message
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

  def clear
    system('clear') || system('cls')
  end

  def reset_game
    board.reset_game
    @current_mover = FIRST_MOVER
    display_board
  end

  def reset_score_and_game
    @score = { human_score: 0, computer_score: 0 }
    reset_game
  end
end

game = TTTGame.new
game.play
