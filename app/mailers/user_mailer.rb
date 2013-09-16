class UserMailer < ActionMailer::Base
  default from: "Survey Registration"

  def verify_email(user)
  	@user = user
  	@verification_link = "#{HOST}/verification/#{@user.registration_token}"
  	mail(:to => user.email, :subject => "Email Registration")
  end
end
