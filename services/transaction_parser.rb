require 'set'

class TransactionService
  def initialize(transactions)
    @transactions = transactions
  end

  def run
    @transactions
      .uniq { |t| t.activity_id }
      .sort_by { |t| [t.date, -t.amount] }
  end

  def end_balance
    @transactions.last.balance
  end
end
