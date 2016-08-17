class Anounce < ActionMailer::Base
 
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notification.completed.subject
  #
  def completed (anouncement,user)
    @anouncement = anouncement
    @user = user
    mail_ids = @user.clients.pluck(:email).join(", ")

    mail to: "#{mail_ids}" , cc: "#{user.email}",subject: "FYI:: #{anouncement.title} !"
  end
end
