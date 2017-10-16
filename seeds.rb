require_relative('../models/transaction')
require_relative('../models/user')
require_relative('../models/tag')

require('pry-byebug')

Transaction.delete_all()
User.delete_all()
Tag.delete_all()

user1 = User.new({ 'name' => 'Ella Ferguson', 'budget' => 750 })
user1.save()

tag1 = Tag.new({ 'name' => 'transport' })
tag2 = Tag.new({ 'name' => 'eating_out' })
tag3 = Tag.new({ 'name' => 'clothes' })
tag4 = Tag.new({ 'name' => 'groceries' })
tag5 = Tag.new({ 'name' => 'make_up' })
tag1.save()
tag2.save()
tag3.save()
tag4.save()
tag5.save()

transaction1 = Transaction.new({ 'merchant_name' => 'FirstBus', 'value' => 44, 'date' => 'October 2017', 'tag_id' => tag1.id })
transaction2 = Transaction.new({ 'merchant_name' => 'Costa', 'value' => 2, 'date' => 'October 2017', 'tag_id' => tag2.id })
transaction3 = Transaction.new({ 'merchant_name' => 'Shell', 'value' => 25, 'date' => 'November 2017', 'tag_id' => tag1.id })
transaction4 = Transaction.new({ 'merchant_name' => 'Next', 'value' => 30, 'date' => 'November 2017', 'tag_id' => tag3.id })
transaction5 = Transaction.new({ 'merchant_name' => 'Asda', 'value' => 35, 'date' => 'October 2017', 'tag_id' => tag4.id })
transaction6 = Transaction.new({ 'merchant_name' => 'Frasers', 'value' => 20, 'date' => 'October 2017', 'tag_id' => tag5.id })
transaction1.save()
transaction2.save()
transaction3.save()
transaction4.save()
transaction5.save()
transaction6.save()

binding.pry
nil
