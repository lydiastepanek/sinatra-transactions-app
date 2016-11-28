require 'set'

class TransactionParser
  def initialize(transactions)
    @transactions = transactions
  end

  def run
    @transactions
      .uniq { |t| t.activity_id }
      .sort_by { |t| [t.date, -t.amount] }
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
