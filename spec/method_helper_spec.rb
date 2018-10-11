# frozen_string_literal: true

require 'transactions'
require 'printer'

def date
  @date = Time.now.strftime('%Y/%d/%m')
end

def single_deposit
  transaction.make_deposit(date, 1000)
end

def single_withdrawal
  transaction.make_withdrawal(date, 500)
end

def single_deposit_single_withdrawal
  transaction.make_deposit(date, 1000)
  transaction.make_withdrawal(date, 1000)
end

def multi_deposit
  transaction.make_deposit(date, 1000)
  transaction.make_deposit(date, 2000)
end
