class ReminderMailer < ApplicationMailer
  def reminder_mail(user)
    @request = user.name
    emailuser = user.email
    mail(to: emailuser, subject: 'Still interested?')
  end
end
