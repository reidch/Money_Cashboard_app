require 'minitest/autorun'
require 'minitest/rg'

require_relative '../models/user'

class TestUser < MiniTest::Test

def setup()
	@user = User.new({ 'name' => 'Ella Ferguson', 'budget' => 750 })
end

def test_user_name()
	assert_equal("Ella Ferguson", @user.name())
end

def test_user_budget()
	assert_equal(750, @user.budget())
end

end
