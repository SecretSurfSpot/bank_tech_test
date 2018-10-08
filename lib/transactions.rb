class Transactions

  attr_reader :balance, :transaction_log

  def initialize
    @balance = 0
    @transaction_log = [" date || credit || debit || balance"]
  end

  def make_deposit(date, amount)
    @balance += amount
  end

  def make_withdrawl(date, amount)
    @balance -= amount
  end
end
