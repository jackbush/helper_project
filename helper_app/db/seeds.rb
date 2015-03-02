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

admin = User.new
admin.username = 'admin'
admin.email = 'admin@app.com'
admin.password = 'password'
admin.password_confirmation = 'password'
admin.role = 'admin'
admin.save!

user_s = User.new
user_s.username = 'TestSenior'
user_s.email = 'testsenior@app.com'
user_s.password = 'password'
user_s.password_confirmation = 'password'
admin.role = 'senior'
user_s.save!

user_j1 = User.new
user_j1.username = 'TestJunior1'
user_j1.email = 'testjunior1@app.com'
user_j1.password = 'password'
user_j1.password_confirmation = 'password'
admin.role = 'junior'
user_j1.save!

user_j2 = User.new
user_j2.username = 'TestJunior2'
user_j2.email = 'testjunior2@app.com'
user_j2.password = 'password'
user_j2.password_confirmation = 'password'
admin.role = 'junior'
user_j2.save!

job = Job.create(title: 'Collect My Groceries', description: 'There is a shop around the corner and they are paid for, pretty please collect them and get them up the stairs', address: 'SE7 8UG', instructions: 'Shopping list: rice, noodles, wine, broccoli. Buzzer 3. 07501234567 if problems. Much obliged.', poster: user_s)

Bid.create(job: job, applicant: user_j1, note: 'I can swing by on the way home tomorrow.')
Bid.create(job: job, applicant: user_j2, note: 'Would love to help out.')