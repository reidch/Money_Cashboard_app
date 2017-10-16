require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')

require_relative('./controllers/tags_controller')
require_relative('./controllers/transactions_controller')

get '/home' do
	erb( :home )
end
