class Printer

  def self.print_statement(header, transactions)
    statement =[]
    statement.push header

    transactions.reverse.each do |line|
      statement.push "#{line} \n"
    end
    return statement
  end

end
