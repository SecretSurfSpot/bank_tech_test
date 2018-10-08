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
      expect(transaction.transaction_log("10/10/2018", 1000, 0, 2000)).to include(" date || credit || debit || balance", "10/10/2018, 1000, 0, 2000")
      transaction.make_deposit("10/10/2018", 1000)
      transaction.make_deposit("10/10/2018", 1000)
      transaction.make_deposit("10/10/2018", 1000)
      expect(transaction.transaction).to include(" date || credit || debit || balance",
        "10/10/2018, 1000, 0, 1000",
        "10/10/2018, 1000, 0, 2000",
        "10/10/2018, 1000, 0, 3000")
    end

    it 'is written to by #make_withdrawl' do
      transaction.make_deposit("10/10/2018", 1000)
      transaction.make_withdrawl("10/10/2018", 500)
      transaction.make_withdrawl("10/10/2018", 500)
      expect(transaction.transaction).to include(" date || credit || debit || balance",
        "10/10/2018, 1000, 0, 1000",
        "10/10/2018, 0, 500, 500",
        "10/10/2018, 0, 500, 0")
    end
  end
end

describe 'Printer' do

  let(:printer) { Printer.new }

  it 'should initially print only heading values' do
    expect(printer.print_statement).to include(" date || credit || debit || balance")
  end

end
