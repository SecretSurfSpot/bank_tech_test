# frozen_string_literal: true

require 'transactions'
require 'method_helper_spec'

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
      expect { transaction.make_deposit(date, -1000) }.to raise_error 'Error: number must be positive'
    end

    it 'should raise an error if deposit isn\'t an integer' do
      # expect { transaction.make_deposit(date, 'string') }.to raise_error 'Error: amount must be a number'
    end
  end

  context 'make_withdrawal' do
    before(:each) do
      transaction.make_deposit(date, 1000)
    end

    it 'should deduct the balance by the given withdrawal amount' do
      transaction.make_withdrawal(date, 100)
      expect(transaction.balance).to eq(900)
    end

    it 'should raise an error if withdrawal isn\'t a positive number' do
      expect { transaction.make_withdrawal(date, -1000) }.to raise_error 'Error: number must be positive'
    end

    it 'should raise an error if withdrawal isn\'t an integer' do
      expect { transaction.make_withdrawal(date, 'string') }.to raise_error 'Error: amount must be a number'
    end

    it 'shouldn\'t allow withdrawal if amount is greater than balance' do
      expect { transaction.make_withdrawal(date, 1001) }.to raise_error 'Error: insufficient funds - try a smaller amount'
    end
  end

  context 'transaction_log' do
    it 'should write all deposits & withdrawals to the transaction_log' do
      transaction.transaction_log(date, 1000, nil, 1000)
      transaction.transaction_log(date, 2000, nil, 3000)
      transaction.transaction_log(date, nil, 500, 2500)
      expect(transaction.transactions).to eq(
        [{ date: date, debit: nil, deposit: 1000, balance: 1000 },
         { date: date, debit: nil, deposit: 2000, balance: 3000 },
         { date: date, debit: 500, deposit: nil, balance: 2500 }]
      )
    end
  end

  context 'display_statement' do
    before(:each) do
      multi_deposit # calls method in spec_method_helper.rb
      single_withdrawal # calls method in spec_method_helper.rb
    end
    it 'should result in the statement being printed' do
      expect(transaction.display_statement).to eq(
        ['date || credit || debit || balance',
         "#{date} || || 500.00 || 2500.00",
         "#{date} || 2000.00 || || 3000.00",
         "#{date} || 1000.00 || || 1000.00"]
      )
    end
  end
end
