# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Welcome.delete_all
User.delete_all
Job.delete_all
Bid.delete_all

user_s = User.create(username: 'test senior', role: 'senior')
user_j1 = User.create(username: 'test junior one', role: 'junior')
user_j2 = User.create(username: 'test junior two', role: 'junior')

job = Job.create(title: 'pick up my groceries', description: 'pretty please', postcode: 'SE7 8UG', instructions: 'this will be emailed to you', poster: user_s.id)

Bid.create(job: job.id, applicant: user_j1.id, note: 'i really want it')
Bid.create(job: job.id, applicant: user_j2.id, note: 'i want it more')