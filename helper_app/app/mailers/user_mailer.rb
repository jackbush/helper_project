class UserMailer < ApplicationMailer
  default from: "example@email.com"

  def registration_confirmation (user)
    @user = user
    # attachments["logo.jpg"] = File.read("#{Rails.root}/app/assets/images/logo.jpg")
    mail(to: "#{user.name} <#{user.email}>", subject: 'Thank you for signing up')
  end

  def job_allocation (user)
    @user = user
    # attachments["logo.jpg"] = File.read("#{Rails.root}/app/assets/images/logo.jpg")
    mail(to: "#{user.name} <#{user.email}>", subject: 'You got a task!')
  end

end