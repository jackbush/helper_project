# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Welcome.detele_all
User.detele_all
Job.detele_all
Bid.detele_all

s = User.create(username: 'test senior', role: 'senior')
User.create(username: 'test junior one', role: 'junior')
User.create(username: 'test junior two', role: 'junior')

Job.create(title: 'pick up my groceries', description: 'pretty please', postcode: 'SE7 8UG', instructions: 'this will be emailed to you', poster: s.id)

Bid.create()
Bid.create()