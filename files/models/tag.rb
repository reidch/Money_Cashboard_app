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

	def self.all()
     sql = "SELECT * FROM tags"
     values = []
     tags = SqlRunner.run(sql, values)
     result = tags.map { |tag| Tag.new(tag) }
     return result
   end

	def self.total_by_tag(id)
		sql = "SELECT SUM(value) FROM transactions WHERE tag_id=$1;"
		values = [id]
		transactions = SqlRunner.run(sql, values).first
		return transactions['sum']
	end

	def self.delete_all()
    sql = "DELETE FROM tags"
    values = []
    SqlRunner.run(sql, values)
  end

end
