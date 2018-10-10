# frozen_string_literal: true

class Printer

  BANK_STATEMENT_HEADER = "date || credit || debit || balance"

  def self.print_statement(transactions)
    statement = []
    add_header(statement)
    format_statement(transactions, statement)
    statement.each do |line|
      puts line
    end
  end

  private

  def self.format_statement(transactions, statement)
    transactions.reverse.each do |line|
      statement.push "#{line[:date]} ||"\
      " #{decimalize_number(line[:deposit])} ||"\
      " #{decimalize_number(line[:debit])} ||"\
      " #{decimalize_number(line[:balance])}"
    end
  end

  def self.add_header(statement)
    statement.push "#{BANK_STATEMENT_HEADER}"
  end

  def self.decimalize_number(number)
    "%.2f" % number.to_f
  end
end
