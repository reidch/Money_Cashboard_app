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

get '/transactions/new' do
	@tags = Tag.all()
	erb( :new )
end

# show and delete erb files 
get '/transactions/:id' do
	@transaction = Transaction.find(params['id'])
	erb( :show )
end

post '/transactions/:id/delete' do
	@transaction = Transaction.find(params['id'])
	@transaction.delete()
	erb( :delete )
end

post '/transactions' do
  @transaction = Transaction.new(params)
  @transaction.save()
  erb( :create )
end

# get '/transactions/:id/edit' do
# 	@transaction = Transaction.find(params['id'])
# 	@tags = Tags.all()
# 	erb( :edit )
# end
