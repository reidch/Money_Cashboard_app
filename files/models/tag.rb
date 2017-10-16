require_relative('../db/sql_runner')

class Tag

	attr_accessor :name
	attr_reader :id

	def initialize( options )
		@id = options['id'].to_i if options['id']
		@name = options['name']
	end

	def save()
    sql = "INSERT INTO tags (
      name
    )
    VALUES
    (
      $1
    )
    RETURNING id"
    values = [@name]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

	def update()
		sql = "UPDATE tags SET
		(
			name
		) = (
			$1
		)
		WHERE id = $2"
		values = [@name, @id]
    SqlRunner.run(sql, values)
	end

	# it 'should return a total of all transactions with a specific tag', function()
	def total_by_tag()
		sql = "SELECT SUM(value) FROM transactions WHERE tag_id=$1;"
		values = [@id]
		transactions = SqlRunner.run(sql, values).first
		return transactions['sum'].to_i
	end

	def self.delete_all()
    sql = "DELETE FROM tags"
    values = []
    SqlRunner.run(sql, values)
  end

end
