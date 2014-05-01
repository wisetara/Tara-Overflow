class UserSignup < ActionMailer::Base
  default from: "from@example.com"

  def signup_confirmation(user)
    @user = user
    mail to: user.email, subject: "You're part of Tara Overflow!"
  end
end
