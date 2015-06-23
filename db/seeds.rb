# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Item.create(content: 'first item')
i2 = Item.create(content: 'second item')
	i2.children.create(content: 'second child1')
	i2.children.create(content: 'second child2')
	i2.children.create(content: 'second child3')
Item.create(content: 'third item')
Item.create(content: 'fourth item')
Item.create(content: 'fifth item')
