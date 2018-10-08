class Transactions

  attr_reader :balance, :transaction

  def initialize
    @balance = 0
    @transaction = [" date || credit || debit || balance"]
  end

  def make_deposit(date, amount)
    @balance += amount
    transaction_log(balance)
  end

  def make_withdrawl(date, amount)
    @balance -= amount
  end

  def transaction_log(balance)
    @transaction << balance
  end
end
