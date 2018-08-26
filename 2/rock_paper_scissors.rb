require "pry"

VALID_CHOICES = ['r', 'p', 'sc', 'l', 'sp']
WINNING_COMBINATIONS = {
  r: ['l', 'sc'],
  p: ['sp', 'r'],
  sc: ['l', 'p'],
  l: ['sp', 'p'],
  sp: ['r', 'sc']
}

def prompt(msg)
  puts "=> #{msg}"
end

def win?(first, second)
  WINNING_COMBINATIONS[first.to_sym].include?(second)
end

def display_result(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("Computer won!")
  else
    prompt("It's a tie!")
  end
end

loop do
  player_win_counter = 0
  computer_win_counter = 0
  while player_win_counter < 5 && computer_win_counter < 5 do
    choice = ''
    loop do
      prompt "Choose one (rock, paper, scissors, lizard or spock): 
      #{VALID_CHOICES.join(', ')}"
      choice = gets.chomp
      if VALID_CHOICES.include?(choice)
        break
      else
        prompt("That's not a valid choice.")
      end
    end

    computer_choice = VALID_CHOICES.sample

    prompt("You chose: #{choice}; Computer chose: #{computer_choice}")

    display_result(choice, computer_choice)
    player_win_counter += 1 if win?(choice, computer_choice)
    computer_win_counter += 1 if win?(computer_choice, choice)

    prompt("Your current score: #{player_win_counter}
            Computer's current score: #{computer_win_counter}")

    
  end
  if player_win_counter == 5
    prompt("Congratulations on your big success!")
  else
    prompt("Sorry for your loss!")
  end

  prompt("Do you want to play again? (Y to play again)")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("Thank you for playing!")
