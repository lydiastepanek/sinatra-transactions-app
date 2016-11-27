require 'sinatra'
require 'haml'
require 'json'
require_relative 'services/transaction_parser'

get '/' do
  content_type 'text/plain'
  File.read(File.expand_path(File.dirname(__FILE__)) + '/README.md')
end

get '/:ledger_name' do
  data_file = File.read(File.expand_path(File.dirname(__FILE__)) + "/data/#{params[:ledger_name]}.json")
  @ledger_data = JSON.parse(data_file)
  @service = TransactionParser.new
  @service.run
  # @service.some_service(arg1, arg2).to_json

  raise 'No data' unless @ledger_data

  haml :ledger
end
