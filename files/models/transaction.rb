require_relative('../db/sql_runner')
require_relative('./tag.rb')

class Transaction

	attr_accessor :merchant_name, :value, :date
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

	def update()
		sql = "UPDATE transactions SET
		(
			tag_id,
			merchant_name,
			value,
			date
		) = (
			$1, $2, $3, $4
    )
    WHERE id = $5"
		values = [@tag_id, @merchant_name, @value, @date, @id]
    SqlRunner.run(sql, values)
	end

	def self.all()
     sql = "SELECT * FROM transactions"
     values = []
     students = SqlRunner.run(sql, values)
     result = transactions.map { |transaction| Transaction.new(transaction) }
     return result
   end

	def self.find(merchant_name)
     sql = "SELECT * FROM transactions WHERE merchant_name = $1"
     values = [merchant_name]
     transaction = SqlRunner.run(sql, values)
     result = Transaction.new(transaction.first)
     return result
   end

	 def self.total()
		 sql = "SELECT SUM(value) FROM transactions;"
		 values = []
		 transactions = SqlRunner.run(sql, values).first
		 return transactions['sum'].to_i
	 end

# DELETE function commented out so that the transaction is restored when seeds.rb is run again
	# def delete()
  #    sql = "DELETE FROM transactions WHERE id = $1"
  #    values = [@id]
  #    SqlRunner.run(sql, values)
  #  end

	def self.delete_all()
    sql = "DELETE FROM transactions"
    values = []
    SqlRunner.run(sql, values)
  end

end
