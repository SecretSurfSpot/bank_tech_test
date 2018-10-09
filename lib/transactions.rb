require_relative 'printer'
class Transactions

  attr_reader :balance, :transaction

  def initialize
    @balance = 0
    @transaction = [" date || credit || debit || balance"]
  end

  def make_deposit(date, amount)
    @balance += amount
    transaction_log(date, amount, 0, balance)
  end

  def make_withdrawl(date, amount)
    @balance -= amount
    transaction_log(date, 0, amount, balance)
  end

  def transaction_log(date, deposit_amount, debit_amount, balance)
    @transaction << "#{date}, #{deposit_amount}, #{debit_amount}, #{balance}"
  end

  def display_statement(printer = Printer)
      printer.print_statement(transaction)
  end


end
