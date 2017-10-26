require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')

require_relative('../models/transaction')
require_relative('../models/tag')

get '/transactions' do
	@transactions = Transaction.all()
	@total = Transaction.total()
	erb( :index )
end

get '/transactions/by_tag/:tag_id' do
	@tag = Tag.find(params['tag_id'].to_i)
	erb( :by_tag )
end

get '/transactions/new' do
	@tags = Tag.all()
	erb( :new )
end

post '/transactions' do
  @transaction = Transaction.new(params)
  @transaction.save()
  erb( :create )
end
