# frozen_string_literal: true

class Printer
  BANK_STATEMENT_HEADER = 'date || credit || debit || balance'

  def print_statement(transactions)
    statement = []
    format_statement(transactions, statement)
    add_header(statement)
    statement.each do |line|
      puts line
    end
  end

  private

  def format_statement(transactions, statement)
    transactions.reverse.each do |line|
      if line[:deposit].nil?
        statement.push "#{line[:date]} || "\
        '||'\
        " #{decimalize_number(line[:debit])} || "\
        "#{decimalize_number(line[:balance])}"
      else
        statement.push "#{line[:date]} || "\
        "#{decimalize_number(line[:deposit])} || "\
        '||'\
        " #{decimalize_number(line[:balance])}"
      end
    end
  end

  def add_header(statement)
    statement.unshift BANK_STATEMENT_HEADER.to_s
  end

  def decimalize_number(number)
    '%.2f' % number.to_f unless number.nil?
  end
end
