class UserMailer < ApplicationMailer
  default from: "example@email.com"


  #how to hit the trigger for this with user create method in hidden controller?
  
  def registration_confirmation(user)
    @user = user
    # attachments["logo.jpg"] = File.read("#{Rails.root}/app/assets/images/logo.jpg")
    mail(to: "#{user.name} <#{user.email}>", subject: 'Thank you for signing up')
  end

  def job_allocation(user, job)
    @user = user
    @job = job
    mail(to: "#{user.email}", subject: 'You got a task!') do |format|
      format.text
      format.html { render locals: 
        { 
          user: user,
          job: job
        } 
      }
    end
  end

end