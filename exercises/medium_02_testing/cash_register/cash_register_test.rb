require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterText < Minitest::Test

  def test_accept_money
    register = CashRegister.new(1000)
    transaction = Transaction.new(20)
    transaction.amount_paid = 20

    previous_amount = register.total_money
    register.accept_money(transaction)
    current_amouunt = register.total_money

    assert_equal previous_amount + 20, current_amouunt
  end

  def test_change
    register = CashRegister.new(1000)
    transaction = Transaction.new(50)
    transaction.amount_paid = 70

    assert_equal 20, register.change(transaction)
  end

  def test_give_receipt
    register = CashRegister.new(1000)
    transaction = Transaction.new(50)

    assert_output("You've paid $50.\n") { register.give_receipt(transaction) }
  end

  def test_prompt_for_payment
    transaction = Transaction.new(17)
    user_input = StringIO.new('20\n')
    output = StringIO.new

    transaction.prompt_for_payment(input: user_input, output: output)
    assert_equal 20, transaction.amount_paid
  end


end