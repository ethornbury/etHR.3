class UserMailer < ActionMailer::Base
#default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.account_activation.subject
  #
  
  def account_activation
    @greeting = "Hi"

    mail to: "to@example.org"
  end
  
  def password_reset
    @greeting = "Hi"

    mail to: "to@example.org"
  end
  ## not sure of above lines
  
  def account_activation (user)
    @user = user
    mail to: user.email, from: "noreply@example.com", subject: "Account activation"
  end
  
  #possible solution to error 
  def  activation_mail(user)
    @user = user
    mail(:to => user.mail, :subject =>"Registration")
  end
  
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.password_reset.subject
  #
  
  def password_reset
    @greeting = "Hi"
    mail to: "to@example.org"
  end
  
end
