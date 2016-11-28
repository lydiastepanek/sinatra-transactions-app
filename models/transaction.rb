class Transaction
  attr_reader :activity_id, :date, :type, :amount, :balance

  def initialize(activity_id, date, type, amount, balance)
    @activity_id = activity_id
    @date = Date.parse(date)
    @type = type
    @amount = amount
    @balance = 7
  end
end
