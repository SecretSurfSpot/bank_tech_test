require 'transactions'
require 'printer'

transaction = Transactions.new

def date
  @date = Time.now.strftime("%Y/%d/%m")
end

def single_deposit
  transaction.make_deposit(date, 1000)
end

def single_withdrawl
  transaction.make_withdrawl(date, 500)
end

def single_deposit_single_withdrawl
  transaction.make_deposit(date, 1000)
  transaction.make_withdrawl(date, 1000)
end

def multi_deposit
  transaction.make_deposit(date, 1000)
  transaction.make_deposit(date, 2000)
end
