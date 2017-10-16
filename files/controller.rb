require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')

# if any new ones created
# require_relative('./models/user')
require_relative('./models/transaction')
require_relative('./models/tag')

get '/transactions' do
	@transactions = Transaction.all()
	@total = Transaction.total()
	erb (:index)
end

get '/transactions/new' do
	@tags = Tag.all()
	erb (:new)
end

post '/transactions' do
  @transaction = Transaction.new(params)
  @transaction.save()
  erb( :create )
end
