# require_relative('../db/sql_runner')
# do I need this line if I'm not going to run this file in the db?

class User

	attr_accessor :name, :budget
	attr_reader :id

	def initialize( options )
		@id = options['id'].to_i if options['id']
		@name = options['name']
		@budget = options['budget'].to_i
	end

	def user_name()
     return "#{@name}"
  end

	def user_budget()
     return @budget
  end

# not put in a delete_all function as yet - required if not going in to db?

end
