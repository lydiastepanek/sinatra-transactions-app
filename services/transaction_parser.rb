require 'json'
# require 'models/transaction'

class TransactionParser
  def initialize(data_file)
    @transactions = JSON.parse(data_file)
  end

  def run
    @transactions.uniq
    # .sort_by do |transaction|
      # [transaction.date, transaction.balance]
    # end
  end
end
