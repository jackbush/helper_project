Welcome.delete_all
User.delete_all
Job.delete_all
Bid.delete_all

admin = User.new
admin.username = 'admin'
admin.email = 'admin@app.com'
admin.password = 'password'
admin.password_confirmation = 'password'
admin.role = 'admin'
admin.save!

user_s1 = User.new
user_s1.username = 'DeloresUmbridge'
user_s1.email = 'DeloresUmbridge@app.com'
user_s1.password = 'password'
user_s1.password_confirmation = 'password'
user_s1.save!

user_s2 = User.new
user_s2.username = 'DaveGibbs'
user_s2.email = 'DaveGibbs@app.com'
user_s2.password = 'password'
user_s2.password_confirmation = 'password'
user_s2.save!

user_j1 = User.new
user_j1.username = 'JuliaFenn'
user_j1.email = 'JuliaFenn@app.com'
user_j1.password = 'password'
user_j1.password_confirmation = 'password'
user_j1.save!

user_j2 = User.new
user_j2.username = 'ZackYaw'
user_j2.email = 'ZackYaw@app.com'
user_j2.password = 'password'
user_j2.password_confirmation = 'password'
user_j2.save!

user_j3 = User.new
user_j3.username = 'HenryBersani'
user_j3.email = 'HenryBersani@app.com'
user_j3.password = 'password'
user_j3.password_confirmation = 'password'
user_j3.save!

user_j4 = User.new
user_j4.username = 'JaneSmith'
user_j4.email = 'JaneSmith@app.com'
user_j4.password = 'password'
user_j4.password_confirmation = 'password'
user_j4.save!

user_j5 = User.new
user_j5.username = 'MikeReed'
user_j5.email = 'MikeReed@app.com'
user_j5.password = 'password'
user_j5.password_confirmation = 'password'
user_j5.save!

job1 = Job.create(title: 'Pick up my groceries', 
                 description: "There's a Sainsburys down the road where my groceries need to be collected from, but I'm having a hard time getting them up the hill!",
                 instructions: 'Order number is 87656807976, they should be ready from 4pm',
                 address: '37 Charlton Church Lane, Charlton, Greenwich',
                 postcode: 'SE7 7AG',
                 date_time: 'Wed, 13 May 2015 16:30:00 UTC +00:00',
                 poster: user_s1
                 )

job2 = Job.create(title: 'Get the leaves out of my gutter', 
                 description: "Autumn is coming and it's leaking into my bathroom. My husband used to do it, but I can't get up the ladder. Any time this weekend would be great, thanks.",
                 instructions: "Hope you're okay with heights! It's on the fourth floor.",
                 address: 'Flat D, 1 The Village, Charlton, London',
                 postcode: 'SW7 8UG',
                 date_time: 'Sat, 16 May 2015 11:00:00 UTC +00:00',
                 poster: user_s1
                 )

job3 = Job.create(title: 'Company for dinner', 
                 description: "It's hard living alone, and I find eating alone the hardest part. I'll cook, that's okay, just an hour or two of company would be lovely. If you have dietary limits, please leave a note!",
                 instructions: "Just bring yourself.",
                 address: '78 Gayford Rd., White City, London',
                 postcode: 'W12 9BW',
                 date_time: 'Fri, 15 May 2015 18:00:00 UTC +00:00',
                 poster: user_s2
                 )

job4 = Job.create(title: 'Pick up my perscription?', 
                 description: "I'm too sick to leave the house, and my neighbour's away for the week -- if anyone could pick up my perscription I'd be much obliged.",
                 instructions: "Under the name Yaw, should be three boxes.",
                 address: '68 Hanbury St',
                 postcode: 'E1 5JL',
                 date_time: 'Mon, 18 May 2015 09:30:00 UTC +00:00',
                 poster: user_j2
                 )

Bid.create(job: job1, applicant: user_j2, note: 'Happy to help, will be an hour late though.', date_time: 'Wed, 13 May 2015 17:30:00 UTC +00:00')

Bid.create(job: job1, applicant: user_j1, note: 'I can swing by on the way home tomorrow.', date_time: 'Wed, 13 May 2015 19:30:00 UTC +00:00')

Bid.create(job: job2, applicant: user_j3, date_time: job1.date_time)

