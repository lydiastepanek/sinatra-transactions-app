class Transaction
  attr_reader :date, :type, :amount, :balance

  def initialize(date, type, amount, balance)
    @date = Date.parse(date).to_s
    @type = type
    @amount = amount
    @balance = balance
  end
end
