# frozen_string_literal: true

require_relative 'printer'
class Transactions
  attr_reader :balance, :transaction

  def initialize
    @balance = 0
    @transaction = []
  end

  def make_deposit(date, amount)
    raise ArgumentError, 'Error: amount must be a number' unless amount.is_a? Integer
    raise ArgumentError, 'Error: number positive' unless amount.positive?
    @balance += amount
    transaction_log(date, amount, nil, balance)
  end

  def make_withdrawal(date, amount)
    raise ArgumentError, 'Error: amount must be a number' unless amount.is_a? Integer
    raise ArgumentError, 'Error: number positive' unless amount.positive?
    raise ArgumentError, 'Error: insufficient funds - try a smaller amount' unless amount <= @balance
    @balance -= amount
    transaction_log(date, nil, amount, balance)
  end

  def transaction_log(date, deposit_amount, debit_amount, balance)
    @transaction << { date: date, deposit: deposit_amount,
                      debit: debit_amount, balance: balance }
  end

  def display_statement(printer = Printer.new)
    printer.print_statement(transaction)
  end
end
