require_relative('../db/sql_runner')

class Tag

	attr_accessor :name
	attr_reader :id

	def initialize( options )
		@id = options['id'].to_i if options['id']
		@name = options['name']
		@value = options['value'].to_i
	end

	def self.delete_all()
    sql = "DELETE FROM tags"
    values = []
    SqlRunner.run(sql, values)
  end

end
