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

	def self.delete_all()
    sql = "DELETE FROM transactions"
    values = []
    SqlRunner.run(sql, values)
  end

end
