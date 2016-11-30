class Transaction
  attr_reader :activity_id, :date, :type, :amount, :balance

  def initialize(entry)
    @activity_id = entry['activity_id']
    @date = DateTime.parse(entry['date'])
    @type = entry['type']
    @amount = entry['amount']
    @balance = entry['balance']
    @source_type = entry['source']['type'].downcase
    @source_description = entry['source']['description']
    @destination_type = entry['destination']['type'].downcase
    @destination_description = entry['destination']['description']
  end

  def description
    {
      "INVESTMENT" => "Deposit from Chase Bank **0978 for your Investment in #{@destination_description}",
      "DEPOSIT" => "Deposit from #{@source_type} account #{@source_description}",
      "TRANSFER" => "Transfer to #{@destination_description}",
      "WITHDRAWAL" => "Withdrawal into #{@destination_type} account #{@destination_description}",
      "REFUND" => "Refund from #{@source_description}"
    }[@type]
  end
end
