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

user_s = User.new
user_s.username = 'DeloresUmbridge'
user_s.email = 'DeloresUmbridge@app.com'
user_s.password = 'password'
user_s.password_confirmation = 'password'
user_s.save!

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
user_j4.username = 'JohnDoe'
user_j4.email = 'JohnDoe@app.com'
user_j4.password = 'password'
user_j4.password_confirmation = 'password'
user_j4.save!

user_j5 = User.new
user_j5.username = 'MikeReed'
user_j5.email = 'MikeReed@app.com'
user_j5.password = 'password'
user_j5.password_confirmation = 'password'
user_j5.save!

user_j6 = User.new
user_j6.username = 'JaneSmith'
user_j6.email = 'JaneSmith@app.com'
user_j6.password = 'password'
user_j6.password_confirmation = 'password'
user_j6.save!

job = Job.create(title: 'Test Job Two Applicants', 
                 description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                 instructions: 'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur',
                 address: '68 Hanbury St, London',
                 postcode: 'London E1 5JL',
                 date_time: 'Sat, 07 Mar 2015 12:36:45 UTC +00:00',
                 poster: user_s
                 )

job1 = Job.create(title: 'Test Job Helper Assigned', 
                 description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                 instructions: 'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur',
                 address: 'Flat D, 1 The Village, Charlton, London',
                 postcode: 'SW7 8UG',
                 date_time: 'Fri, 06 Mar 2015 17:36:45 UTC +00:00',
                 poster: user_s,
                 helper: user_j3
                 )

Job.create(title: 'Test Job No Applicants', 
                 description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                 instructions: 'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur',
                 address: '78 Gayford Rd, Hammersmith, London W12',
                 postcode: 'W12 9BW',
                 date_time: 'Mon, 09 Mar 2015 17:36:45 UTC +00:00',
                 poster: user_s
                 )

<<<<<<< HEAD
Bid.create(job: job, applicant: user_j1, note: 'I can swing by on the way home tomorrow.')
Bid.create(job: job, applicant: user_j2, note: 'Would love to help out.')


prize1 = Prize.new(company:"British Airways", company_image:"", prize_image:"", title:"", description:"", tier:"" )
prize2 = Prize.new(company:"British Airways", company_image:"", prize_image:"", title:"", description:"", tier:"" )
prize3 = Prize.new(company:"British Airways", company_image:"", prize_image:"", title:"", description:"", tier:"" )
prize4 = Prize.new(company:"British Airways", company_image:"", prize_image:"", title:"", description:"", tier:"" )





t.string   "company"
    t.string   "image"
    t.string   "title"
    t.string   "description"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "company_image"
    t.string   "prize_image"
    t.string   "tier"



=======
Bid.create(job: job, applicant: user_j1, note: 'I can swing by on the way home tomorrow.', date_time: 'Sat, 07 Mar 2015 12:36:45 UTC +00:00')
Bid.create(job: job, applicant: user_j2, note: 'Happy to help, will be an hour late though.', date_time: 'Sat, 07 Mar 2015 13:36:45 UTC +00:00')
Bid.create(job: job1, applicant: user_j3, note: 'You look like my granny.', date_time: job1.date_time)
>>>>>>> development
