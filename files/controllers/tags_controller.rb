require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')

require_relative('../models/tag')

get '/tags' do
	@tags = Tag.all()
	erb( :all_tags )
end

post '/tags' do
	@total = Tag.total_by_tag(params['tag_id'].to_i)
	p @total
	erb( :tag )
end
