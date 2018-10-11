# frozen_string_literal: true

require_relative 'printer'
class Transactions
  attr_reader :balance, :transactions

  def initialize
    @balance = 0
    @transactions = []
  end

  def make_deposit(date, amount)
    verify_numeric(amount)
    verify_positive(amount)
    @balance += amount
    transaction_log(date, amount, nil, balance)
  end

  def make_withdrawal(date, amount)
    verify_numeric(amount)
    verify_positive(amount)
    verify_sufficient_funds(amount)
    @balance -= amount
    transaction_log(date, nil, amount, balance)
  end

  def transaction_log(date, deposit_amount, debit_amount, balance)
    @transactions << { date: date, deposit: deposit_amount,
                      debit: debit_amount, balance: balance }
  end

  def display_statement(printer = Printer.new)
    printer.print_statement(transactions)
  end

  private

  def verify_numeric(amount)
    raise ArgumentError, 'Error: amount must be a number' unless amount.is_a? Integer
  end

  def verify_positive(amount)
    raise ArgumentError, 'Error: number must be positive' unless amount.positive?
  end

  def verify_sufficient_funds(amount)
    raise ArgumentError, 'Error: insufficient funds - try a smaller amount' unless amount <= @balance
  end
end
