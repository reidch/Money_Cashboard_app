require_relative('../db/sql_runner')
require_relative('./tag.rb')

class Transaction

	attr_accessor :merchant_name, :value, :date, :tag_id
	attr_reader :id

	def initialize(options)
		@id = options['id'].to_i if options['id']
		@merchant_name = options['merchant_name']
		@value = options['value'].to_i
		@date = options['date']
		@tag_id = options['tag_id'].to_i
	end

	def save()
    sql = "INSERT INTO transactions (
      tag_id,
      merchant_name,
      value,
			date
    )
    VALUES
    (
      $1, $2, $3, $4
    )
    RETURNING id"
    values = [@tag_id, @merchant_name, @value, @date]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

	def self.all()
    sql = "SELECT * FROM transactions"
    values = []
    transactions = SqlRunner.run(sql, values)
    result = transactions.map { |transaction| Transaction.new(transaction) }
    return result
  end

	def find_tag_name()
		sql = "SELECT tags.* FROM tags INNER JOIN transactions ON transactions.tag_id = tags.id WHERE transactions.id = $1;"
		values =[@id]
		result = SqlRunner.run(sql, values)[0]
		return Tag.new(result).name
  end

	def self.total()
		sql = "SELECT SUM(value) FROM transactions;"
		values = []
		transactions = SqlRunner.run(sql, values).first
		return transactions['sum'].to_i
	end

	def self.delete_all()
    sql = "DELETE FROM transactions"
    values = []
    SqlRunner.run(sql, values)
  end

end
