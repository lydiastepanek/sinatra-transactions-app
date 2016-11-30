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
  transactions = data.map { |entry| Transaction.new(entry) }
  transaction_service = TransactionService.new(transactions)
  @end_balance = transaction_service.end_balance
  @ledger_data = transaction_service.run
  @percentage = 0.to_s

  raise 'No data' unless @ledger_data

  haml :ledger
end
