# frozen_string_literal: true

require 'printer'

describe Printer do
  let(:printer) { Printer.new }
  let(:date) { Time.now.strftime('%Y/%d/%m') }
  let(:transactions_1) { [date: date, deposit: 1000, debit: nil, balance: 1000] }
  let(:transactions_2) { [{ date: date, deposit: 1000, debit: nil, balance: 1000 }, { date: date, deposit: 2000, debit: nil, balance: 3000 }, { date: date, deposit: nil, debit: 500, balance: 2500 }] }

  context 'printer_statement' do
    it 'should print a header if no transactions have been made' do
      expect { printer.print_statement([]) }.to output("date || credit || debit || balance\n").to_stdout
    end

    it 'should print the header first, then spec_method_helper transactions after' do
      expect { printer.print_statement(transactions_1) }.to output("date || credit || debit || balance\n"\
                                                                    "#{date} || 1000.00 || || 1000.00\n").to_stdout
    end

    it 'should print the header first, then the transactions after in ascending order' do
      expect { printer.print_statement(transactions_2) }.to output("date || credit || debit || balance\n"\
                                                                    "#{date} || || 500.00 || 2500.00\n"\
                                                                    "#{date} || 2000.00 || || 3000.00\n"\
                                                                    "#{date} || 1000.00 || || 1000.00\n").to_stdout
    end
  end
end
