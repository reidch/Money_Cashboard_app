require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')

require_relative('../models/tag')

get '/tags' do
	@tags = Tag.all()
	erb( :all_tags )
end

post '/tags' do
	@tag = Tag.find(params['tag_id'].to_i)
	erb( :by_tag )
end
