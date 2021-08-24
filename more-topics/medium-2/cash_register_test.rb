# rubocop:disable Style/Documentation,Style/FrozenStringLiteralComment
# Cash Register Testing Class

require_relative 'cash_register'
require_relative 'transaction'
require 'minitest/autorun'

class CashRegisterTests < Minitest::Test
  def setup
    @register = CashRegister.new(0)
    @empty = Transaction.new(500)
    @full  = Transaction.new(500)
    @full.amount_paid = 500
    @partial = Transaction.new(500)
    @partial.amount_paid = 400
    @over = Transaction.new(500)
    @over.amount_paid = 600
  end

  def test_accept_money
    assert_raises(NoMethodError) { @register.accept_money(72) } # needs transaction
    @register.accept_money(@empty)
    assert_equal(0, @register.total_money) # unpaid transactions add nothing
    @register.accept_money(@full)
    assert_equal(500, @register.total_money) # paid transactions add money
  end

  def test_change
    assert_raises(NoMethodError) { @register.change(72) } # needs transaction
    assert_equal(-100, @register.change(@partial))
    assert_equal(0, @register.change(@full))
    assert_equal(-500, @register.change(@empty))
    assert_equal(100, @register.change(@over))
  end

  def test_give_receipt
    string = "You've paid $500.\n"
    assert_output(string) { @register.give_receipt(@full) }
    assert_output(string) { @register.give_receipt(@over) } # change unaffected
  end
end

# rubocop:enable Style/Documentation,Style/FrozenStringLiteralComment
