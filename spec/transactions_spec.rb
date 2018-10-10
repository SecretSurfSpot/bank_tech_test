require 'transactions'

describe Transactions do
  let(:transaction) { Transactions.new }
  let(:date) { Time.now.strftime('%Y/%d/%m') }

  context 'make_deposit' do
    it 'should increase the balance by deposit amount' do
      transaction.make_deposit(date, 666)
      transaction.make_deposit(date, 666)
      expect(transaction.balance).to eq(1332)
    end

    it 'should raise an error if deposit isn\'t a positive number' do
      expect { transaction.make_deposit(date, -1000) }.to raise_error 'Error: number positive'
    end

    it 'should raise an error if deposit isn\'t an integer' do
      expect { transaction.make_deposit(date, "string") }.to raise_error 'Error: amount must be a number'
    end
  end

  context 'make_withdrawl' do
    it 'should deduct the balance by the given withdrawl amount' do

    end

    it 'should raise an error if withdrawl isn\'t a positive number' do

    end
  end

  context 'transaction_log' do
    it 'should write all deposits & withdrawls to the transaction_log' do

    end
  end
end
