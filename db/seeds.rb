# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

categories = Category.create([ 
  { user_id: nil, name: 'Howsehold' },
  { user_id: nil, name: 'Automobile' },
  { user_id: nil, name: 'Personal Care' },
  { user_id: nil, name: 'Credit Cards' },
  { user_id: nil, name: 'Groceries' },
  { user_id: nil, name: 'Medical Care' },
  { user_id: nil, name: 'Shopping' },
  { user_id: nil, name: 'Vacation' },
  { user_id: nil, name: 'Transaportation' }
])
