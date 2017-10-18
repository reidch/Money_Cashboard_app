require 'minitest/autorun'
require 'minitest/rg'

require_relative '../models/transaction'

class TestTransaction < MiniTest::Test

def setup()
	@transaction = Transaction.new({ 'merchant_name' => 'Shell', 'value' => 25, 'date' => 'August 2017', 'tag' => 'transport' })
end

def test_transaction_value()
	assert_equal(25, @transaction.value())
end

def test_transaction_merchant_name()
	assert_equal('Shell', @transaction.merchant_name())
end

end
