class TransactionParser
  def initialize(transactions)
    @transactions = transactions
  end

  def run
    @transactions.uniq
    # .sort_by do |transaction|
      # [transaction.date, transaction.balance]
    # end
  end
end
