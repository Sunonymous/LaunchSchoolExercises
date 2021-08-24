# Transaction Tests

require 'minitest/autorun'
require_relative 'transaction'
require_relative 'cash_register'

class TestTransaction < Minitest::Test
  def test_prompt_for_payment
    t = Transaction.new(350)
    entry = StringIO.new("350\n")
    outry = StringIO.new
    assert_nil(t.prompt_for_payment(input: entry, output: outry)) # executes correctly
    assert_equal(350, t.amount_paid)
  end
end
