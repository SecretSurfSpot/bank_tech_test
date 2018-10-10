# frozen_string_literal: true

require 'transactions'
require 'spec_method_helper'

describe 'Transactions' do
  let(:transaction) { Transactions.new }
  let(:date) { Time.now.strftime('%Y/%d/%m') }

  it 'should initially have a balance of 0' do
    expect(transaction.balance).to eq(0)
  end

  describe '#make_deposit' do
    it 'adds the amount given to the balance' do
      single_deposit # calls method in spec_method_helper.rb
      expect(transaction.balance).to eq(1000)
    end
  end

  describe 'make_withdrawal' do
    it 'deducts the amount given from the balance' do
      single_deposit_single_withdrawal # calls method in spec_method_helper.rb
      expect(transaction.balance).to eq(0)
    end
  end

  describe 'transaction_log' do
    it 'is written to by #make_deposit' do
      multi_deposit # calls method in spec_method_helper.rb
      expect(transaction.balance).to eq(3000)
    end

    it 'is written to by #make_withdrawal' do
      multi_deposit # calls method in spec_method_helper.rb
      single_withdrawal # calls method in spec_method_helper.rb
      expect(transaction.balance).to eq(2500)
    end
  end

  # describe 'display_statement' do
  #   it 'prints a statement (contents of transaction_log)' do
  #     multi_deposit # calls method in spec_method_helper.rb
  #     single_withdrawal # calls method in spec_method_helper.rb
  #     expect(transaction.display_statement).to eq(
  #       [" date || credit || debit || balance \n",
  #       "#{date} || 0.00 || 500.00 || 2500.00 \n",
  #       "#{date} || 2000.00 || 0.00 || 3000.00 \n",
  #       "#{date} || 1000.00 || 0.00 || 1000.00 \n"])
  #   end
  # end
end
