# frozen_string_literal: true

class Printer

  def self.print_statement(header, transactions)
    statement = []
    statement.push header

    transactions.reverse.each do |line|
      statement.push "#{line} \n"
    end
    statement
  end
end
