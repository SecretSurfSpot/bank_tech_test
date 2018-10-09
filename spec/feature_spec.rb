require 'transactions'
require 'printer'

describe 'Transactions' do

  let(:transaction) { Transactions.new }

  it 'should initially have a balance of 0' do
    expect(transaction.balance).to eq(0)
  end

  describe '#make_deposit' do
    it 'adds the amount given to the balance' do
      transaction.make_deposit(Time.now.strftime("%Y/%d/%m"), 1000)
      expect(transaction.balance).to eq(1000)
    end
  end

  describe 'make_withdrawl' do
    it 'deducts the amount given from the balance' do
      transaction.make_deposit(Time.now.strftime("%Y/%d/%m"), 1000)
      transaction.make_withdrawl(Time.now.strftime("%Y/%d/%m"), 1000)
      expect(transaction.balance).to eq(0)
    end
  end

  describe 'transaction_log' do
    it 'is written to by #make_deposit' do
      transaction.make_deposit("10/01/2012", 1000)
      transaction.make_deposit("13/01/2012", 2000)
      expect(transaction.transaction).to include(" date || credit || debit || balance",
        "10/01/2012, 1000, 0, 1000",
        "13/01/2012, 2000, 0, 3000")
    end

    it 'is written to by #make_withdrawl' do
      transaction.make_deposit("10/01/2012", 1000)
      transaction.make_deposit("13/01/2012", 2000)
      transaction.make_withdrawl("14/01/2012", 500)
      expect(transaction.transaction).to include(" date || credit || debit || balance",
        "10/01/2012, 1000, 0, 1000",
        "13/01/2012, 2000, 0, 3000",
        "14/01/2012, 0, 500, 2500")
    end
  end

  describe 'display_statement' do
    it 'prints a statement (contents of transaction_log)' do
      transaction.make_deposit("10/01/2012", 1000)
      transaction.make_deposit("13/01/2012", 2000)
      transaction.make_withdrawl("14/01/2012", 500)
      expect(transaction.display_statement).to include(" date || credit || debit || balance",
        "10/01/2012, 1000, 0, 1000",
        "13/01/2012, 2000, 0, 3000",
        "14/01/2012, 0, 500, 2500")
    end
  end

end
