require 'transactions'

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

end
