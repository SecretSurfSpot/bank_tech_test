class Transactions

  attr_reader :balance

  def initialize
    @balance = 0
  end

  def make_deposit(date, amount)
    @balance += amount
  end

  def make_withdrawl(date, amount)
    @balance -= amount
  end
end
