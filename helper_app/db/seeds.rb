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

User.create(username: 'test senior', role: 'senior')
User.create(username: 'test junior one', role: 'junior')
User.create(username: 'test junior two', role: 'junior')

Job.create()

Bid.create()
Bid.create()