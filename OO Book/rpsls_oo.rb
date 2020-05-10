class Move
  VALUES = ['rock', 'paper', 'scissors', 'lizard', 'spock']
  ABBREVIATED_VALUES = ['r', 'p', 'sc', 'l', 'sp']

  attr_accessor :greater, :lesser
  def initialize(value)
    @value = value
    @greater, @lesser = set_value
  end

  def >(other_move)
    @greater.include?(other_move.to_s)
  end

  def <(other_move)
    @lesser.include?(other_move.to_s)
  end

  def to_s
    @value
  end
end

# introducing classes for each move
# reduces cyclomatic complexity and perhaps a bit more clarity about the rules
# definitely makes the code more readable

class Rock < Move
  def set_value
    return ['lizard', 'scissors'], ['spock', 'paper']
  end
end

class Paper < Move
  def set_value
    return ['rock', 'spock'], ['scissors', 'lizard']
  end
end

class Scissors < Move
  def set_value
    return ['lizard', 'paper'], ['spock', 'rock']
  end
end

class Lizard < Move
  def set_value
    return ['spock', 'paper'], ['rock', 'scissors']
  end
end

class Spock < Move
  def set_value
    return ['rock', 'scissors'], ['lizard', 'paper']
  end
end

class Player
  attr_accessor :move, :name, :history, :win_loss

  def initialize
    @history = []
    @win_loss = {
      wins: Hash[Move::VALUES.product([0])],
      losses: Hash[Move::VALUES.product([0])]
    }
    set_name
  end

  def make_move(choice)
    @move = case choice
            when 'rock' then Rock.new('rock')
            when 'paper' then Paper.new('paper')
            when 'scissors' then Scissors.new('scissors')
            when 'lizard' then Lizard.new('lizard')
            when 'spock' then Spock.new('spock')
            end
  end
end

class Human < Player
  def valid_name?(str)
    return false if str.empty?
    true
  end

  def set_name
    n = ""
    loop do
      puts "What's your name?"
      n = gets.chomp
      break if valid_name?(n)
      puts "Sorry, must be a valid entry."
    end
    self.name = n
  end

  def choose
    choice = nil
    loop do
      puts "Please choose rock, paper, scissors, lizard or spock"
      print "(r, p, sc, l or sp)."
      choice = gets.chomp.downcase
      break if Move::VALUES.include?(choice) ||
               Move::ABBREVIATED_VALUES.include?(choice)
      puts "Sorry, invalid choice."
    end
    choice_index = Move::ABBREVIATED_VALUES.index(choice)
    choice = Move::VALUES[choice_index] if choice_index
    history << choice
    make_move(choice)
  end
end

class Computer < Player
  def set_name
    self.name = ['R2D2', 'Hal', 'Chappie', 'Sonny', 'Number 5'].sample
  end

  def apply_personality(hash)
    case name
    when 'R2D2'
      hash['rock'] = 50
    when 'Hal'
      hash['scissors'] = 0
      hash['spock'] = 30
    when 'Chappie'
      hash['lizard'] = 20
      hash['paper'] = 2
    when 'Sonny'
      hash['spock'] = 30
    when 'Number 5'
      hash['scissors'] = 25
    end
  end

  def make_choice
    personalities = Hash[Move::VALUES.product([10])]
    apply_personality(personalities)
    personality_array = []
    win_loss[:wins].each do |k, v|
      personalities[k] += v
    end
    win_loss[:losses].each do |k, v|
      personalities[k] -= v unless v == 0
    end
    personalities.each { |k, v| v.times { personality_array << k } }
    personality_array.sample
  end

  def choose
    choice = make_choice
    history << choice
    make_move(choice)
  end
end

class RPSGame
  WINNING_SCORE = 5
  COLS = 11
  WIDTH = COLS * 2 + 1
  attr_accessor :human, :computer, :score

  def initialize
    @human = Human.new
    @computer = Computer.new
    @score = Array.new(2, 0)
    @winner = nil
  end

  def reset_history
    human.history = []
    computer.history = []
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors, Spock, Lizard!"
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors Spock, Lizard!"
  end

  def build_rows
    hum = human.history
    0.upto(hum.size - 1) do |i|
      print "#{hum[i].center(COLS)}|"
      puts computer.history[i].center(COLS)
    end
  end

  def build_table
    puts human.name.center(COLS) + ' ' + computer.name.center(COLS)
    lines = "-" * WIDTH
    puts lines
    build_rows
    puts lines
  end

  def display_moves
    system "clear"
    build_table
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."
  end

  def human_won
    puts "#{human.name} won!"
    computer.win_loss[:losses][computer.move.to_s] += 1
    @score[0] += 1
  end

  def computer_won
    puts "#{computer.name} won!"
    computer.win_loss[:wins][computer.move.to_s] += 1
    @score[1] += 1
  end

  def display_winner
    human_move = human.move
    computer_move = computer.move
    if human_move > computer_move
      human_won
    elsif human_move < computer_move
      computer_won
    else
      puts "It's a tie!"
    end
  end

  def display_score
    puts "The current score is: #{score[0]} - #{score[1]}"
  end

  def overall_winner?
    if score[0] >= WINNING_SCORE
      @winner = 'human'
    elsif score[1] >= WINNING_SCORE
      @winner = 'computer'
    end
  end

  def display_overall_winner
    if @winner == 'human'
      puts "The overall winner is #{human.name}!"
    else
      puts "The overall winner is #{computer.name}!"
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp
      break if ['y', 'n'].include? answer
      puts "Sorry, must be y or n."
    end
    if answer == 'y'
      @score = [0, 0]
      system 'clear'
      true
    else
      false
    end
  end

  def game_loop
    loop do
      reset_history
      loop do
        human.choose
        computer.choose
        display_moves
        display_winner
        display_score
        if overall_winner?
          display_overall_winner
          break
        end
      end
      break unless play_again?
    end
  end

  def play
    display_welcome_message
    game_loop
    display_goodbye_message
  end
end

RPSGame.new.play
