require 'transactions'
require 'printer'
require 'spec_method_helper'

describe 'Transactions' do

  let(:transaction) { Transactions.new }
  let(:date) { Time.now.strftime("%Y/%d/%m") }

  it 'should initially have a balance of 0' do
    expect(transaction.balance).to eq(0)
  end

  describe '#make_deposit' do
    it 'adds the amount given to the balance' do
      single_deposit # calls method in spec_method_helper.rb
      expect(transaction.balance).to eq(1000)
    end
  end

  describe 'make_withdrawl' do
    it 'deducts the amount given from the balance' do
      single_deposit_single_withdrawl # calls method in spec_method_helper.rb
      expect(transaction.balance).to eq(0)
    end
  end

  describe 'transaction_log' do
    it 'is written to by #make_deposit' do
      multi_deposit # calls method in spec_method_helper.rb
      expect(transaction.transaction).to eq([
        "#{date}, 1000, 0, 1000",
        "#{date}, 2000, 0, 3000"])
    end

    it 'is written to by #make_withdrawl' do
      multi_deposit # calls method in spec_method_helper.rb
      single_withdrawl # calls method in spec_method_helper.rb
      expect(transaction.transaction).to eq([
        "#{date}, 1000, 0, 1000",
        "#{date}, 2000, 0, 3000",
        "#{date}, 0, 500, 2500"])
    end
  end

  describe 'display_statement' do
    it 'prints a statement (contents of transaction_log)' do
      multi_deposit # calls method in spec_method_helper.rb
      single_withdrawl # calls method in spec_method_helper.rb
      expect(transaction.display_statement).to eq([" date || credit || debit || balance \n",
        "#{date}, 0, 500, 2500 \n",
        "#{date}, 2000, 0, 3000 \n",
        "#{date}, 1000, 0, 1000 \n"])
    end
  end

end
