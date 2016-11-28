require 'set'

class TransactionParser
  def initialize(transactions)
    @transactions = transactions
  end

  def run
    activity_ids = Set.new
    unique_transactions = []
    @transactions.each do |transaction|
      if !activity_ids.include?(transaction.activity_id)
        unique_transactions << transaction
      end
      activity_ids.add(transaction.activity_id)
    end
    unique_transactions.sort_by do |transaction|
      [transaction.date]
    end
  end

  def add_descriptions
    descriptions = {
      "INVESTOR" => "Investment income from",
      "DEPOSIT" => "",
      "TRANSFER" => "",
      "WITHDRAWAL" => "",
      "REFUND" => ""
    }
  end
end
