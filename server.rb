require 'sinatra'
require 'haml'
require 'json'
require_relative 'services/transaction_parser'
require_relative 'models/transaction'

get '/' do
  content_type 'text/plain'
  File.read(File.expand_path(File.dirname(__FILE__)) + '/README.md')
end

get '/:ledger_name' do
  data_file = File.read(File.expand_path(File.dirname(__FILE__)) + "/data/#{params[:ledger_name]}.json")
  data = JSON.parse(data_file)
  transactions = data.map do |entry|
    Transaction.new(entry['activity_id'], entry['date'], entry['type'], entry['amount'], entry['balance'])
  end
  puts 'TRANSACTIONSSSSSSSSS'
  puts transactions.inspect
  @ledger_data = TransactionParser.new(transactions).run

  raise 'No data' unless @ledger_data

  haml :ledger
end
