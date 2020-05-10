require 'minitest/autorun'

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < MiniTest::Test

  def test_accept_money
    register = CashRegister.new(1000)
    transaction = Transaction.new(20)
    transaction.amount_paid = 20

    previous_amount = register.total_money
    register.accept_money(transaction)
    new_amount = register.total_money
    # assert_equal(1000, previous_amount)
    # assert_equal(1020, new_amount)
    assert_equal previous_amount + 20, new_amount
  end

  def test_change
    register = CashRegister.new(1000)
    transaction = Transaction.new(20)
    transaction.amount_paid = 30

    assert_equal 10, register.change(transaction)
  end

  def test_give_receipt
    register = CashRegister.new(1000)
    transaction = Transaction.new(20)
    output = "You've paid $20.\n"
    
    assert_output (output) {register.give_receipt(transaction)}
  end  
end

class TransactionTest < MiniTest::Test

  # def test_prompt_for_payment
  #   transaction = Transaction.new(30)
  #   input = StringIO.new('40\n')
  #   capture_stdout { transaction.prompt_for_payment(input: input) }
  #   assert_equal 40, transaction.amount_paid

  #   # assert_output(output) { transaction.prompt_for_payment }

  # end

  # def capture_stdout(&block)
  #   original_stdout = $stdout
  #   $stdout = fake = StringIO.new
  #   begin
  #     yield
  #   ensure
  #     $stdout = original_stdout
  #   end
  #   fake.string
  # end

  def test_prompt_for_payment
    transaction = Transaction.new(30)
    input = StringIO.new('40\n')
    output = StringIO.new
    transaction.prompt_for_payment(input: input, output: output)
    assert_equal 40, transaction.amount_paid
    # puts input.string, output.string

    # assert_output(output) { transaction.prompt_for_payment }
  end
end


  # def prompt_for_payment(input: $stdin) # We've set a default parameter for stdin
  #   loop do
  #     puts "You owe $#{item_cost}.\nHow much are you paying?"
  #     @amount_paid = input.gets.chomp.to_f # notice that we call gets on that parameter
  #     break if valid_payment? && sufficient_payment?
  #     puts 'That is not the correct amount. ' \
  #         'Please make sure to pay the full cost.'
  #   end
  # end

