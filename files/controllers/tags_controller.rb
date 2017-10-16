require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')

require_relative('../models/tag')

get '/tags/:id' do
	@total = Tag.total_by_tag(params['id'].to_i)
	p @total
	erb( :tag )
end
