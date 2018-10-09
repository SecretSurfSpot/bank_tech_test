class Printer

  def self.print_statement(transactions)
    transactions.each do |line|
      puts "#{line}"
    end
  end

end
