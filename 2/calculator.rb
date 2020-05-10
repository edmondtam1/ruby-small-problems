# ask user for 2 numbers
# ask user for an operation to perform
# perform operation on both numbers
# output the result

# answer = gets
# puts answer
# puts Dir.pwd --> helped me realise what dir I'm in!
require "pry"
require "yaml"
MESSAGES = YAML.load_file('calculator_messages.yml')
LANGUAGE = 'en'

def messages(message, lang='en')
  MESSAGES[lang][message]
end

def prompt(key)
  message = messages(key, LANGUAGE)
  message = key if message == nil
  Kernel.puts("=> #{message}")
end

def valid_number?(num)
  num.to_i() != 0
  # num.to_i.to_s == num
  # /^d+$/.match(num)
end

def integer?(num)
  /^\d+$/.match(num)
end

def float?(num)
  /\d/.match(num) && /^\d*\.?\d*$/.match(num)
end

def number?(num)
  integer?(num) || float?(num)
end

def operation_to_message(op)
  word =  case op
          when '1'
            'Adding'
          when '2'
            'Subtracting'
          when '3'
            'Multiplying'
          when '4'
            'Dividing'
          end

  word
end

prompt('welcome')

name = ''
loop do
  name = Kernel.gets().chomp()

  if name.empty?()
    prompt('valid_name')
  else
    break
  end
end

prompt("Hi #{name}!")

loop do # main loop
  num1 = nil
  num2 = nil

  loop do
    prompt('first_number')
    num1 = Kernel.gets().chomp()

    if valid_number?(num1)
      break
    else
      prompt('invalid_number')
    end
  end

  loop do
    prompt('second_number')
    num2 = Kernel.gets().chomp()

    if valid_number?(num2)
      break
    else
      prompt('invalid_number')
    end
  end

  operator_prompt = <<-MSG
    What operator would you like to perform?
    1) add
    2) subtract
    3) multiply
    4) divide
  MSG

  prompt(operator_prompt)
  operator = ''
  loop do
    operator = Kernel.gets().chomp()
    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt("Must choose 1, 2, 3 or 4")
    end
  end

  binding.pry

  prompt("#{operation_to_message(operator)} the two numbers...")

  result = case operator
           when '1'
             num1.to_i() + num2.to_i()
           when '2'
             num1.to_i() - num2.to_i()
           when '3'
             num1.to_i() * num2.to_i()
           when '4'
             num1.to_f() / num2.to_f()
           end

  Kernel.puts("Result is #{result}")

  prompt("Do you want another calculation? (Y to calculate again)")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end
