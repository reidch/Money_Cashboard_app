require_relative('../db/sql_runner')

class User

	attr_accessor :name, :budget
	attr_reader :id

	def initialize( options )
		@id = options['id'].to_i if options['id']
		@name = options['name']
		@budget = options['budget'].to_i
	end

	def name()
    return @name
  end

	def budget()
    return @budget
  end

	def save()
    sql = "INSERT INTO users
    (
    name,
		budget
    )
    VALUES
    (
    $1, $2
    )
    RETURNING id"
    values = [@name, @budget]
	  @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

	def self.delete_all()
    sql = "DELETE FROM users"
    values = []
    SqlRunner.run(sql, values)
  end

end
