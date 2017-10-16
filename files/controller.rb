require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')

# if any new ones created
# require_relative('./models/user')
require_relative('./models/transaction')
# require_relative('./models/tag')

get '/transactions' do
	@transactions = Transaction.all()
	erb (:index)
end
