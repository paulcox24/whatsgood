class UserMailer < ActionMailer::Base
  default from: "whatsgoodaroundme@gmail.com"

  def contact_email(email)
  	@name = email[:name]
  	@message = email[:message]
  	mail(to: 'whatsgoodaroundme@gmail.com', subject: 'just a test')
  end
end
