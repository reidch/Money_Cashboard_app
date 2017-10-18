require 'minitest/autorun'
require 'minitest/rg'

require_relative '../models/tag'

class TestTag < MiniTest::Test

def setup()
	@tag = Tag.new({ 'name' => 'takeaways' })
end

def test_tag_name()
	assert_equal('takeaways', @tag.name())
end

end
