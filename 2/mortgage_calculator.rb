# pseudo code
# START
# # make sure to validate all the figures in loops
# GET loan amount = nil
# GET APR = nil
# GET loan duration = nil

# SET loan months = loan duration * 12
# SET interest_rate = APR / 12

# PRINT loan months
# PRINT interest_rate
# SET monthly_payment using formula
# PRINT monthly_payment

require "yaml"
MESSAGES = YAML.load_file('mortgage_messages.yml')
LANGUAGE = 'en'

def messages(message, lang='en')
  MESSAGES[lang][message]
end

def prompt(key)
  message = messages(key, LANGUAGE)
  message = key if message.nil?
  puts "=> " + message
end

# def user_input(type)
# end

def integer?(num)
  /^\d+$/.match(num) && num.to_i >= 0
end

def float?(num)
  /\d/.match(num) && /^\d*\.?\d*$/.match(num) && num.to_f >= 0
end

def valid?(num)
  integer?(num) || float?(num)
end

loan_amount = nil
annual_rate = nil
loan_annual = nil

prompt('welcome')

loop do
  loop do
    prompt('loan_amount')
    loan_amount = gets.chomp
    break if valid?(loan_amount)
    prompt('invalid_entry')
  end

  loop do
    prompt('annual_rate')
    annual_rate = gets.chomp
    break if valid?(annual_rate)
    prompt('invalid_entry')
  end

  loop do
    prompt('loan_annual')
    loan_annual = gets.chomp
    break if valid?(loan_annual)
    prompt('invalid_entry')
  end

  prompt('input_thanks')
  prompt("loan_amount_done")
  prompt(loan_amount)
  prompt("annual_rate_done")
  prompt(annual_rate)
  prompt("loan_duration_done")
  prompt(loan_annual)

  monthly_rate = annual_rate.to_f / 1200
  loan_monthly = loan_annual.to_f * 12

  monthly_payment = loan_amount.to_f *
                    (monthly_rate / 
                    (1 - (1 + monthly_rate)**-loan_monthly))

  prompt("Your monthly payment is #{format('%02.2f', monthly_payment)}")
  prompt("Would you like to go again? (Y if so)")
  again = gets.chomp.downcase
  break if again != "y"
end

prompt("Thanks for using the calculator!")
