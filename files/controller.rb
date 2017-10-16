require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')

require_relative('./controllers/tags_controller')
require_relative('./controllers/transactions_controller')

get '/' do
	# homepage - need to write this to take to homepage
end
