class UserMailer < ActionMailer::Base
  default from: "whatsgoodaroundme@gmail.com"

  def contact_email(email)
  	@name = email[:name]
  	@email_address = email[:email]
  	@message = email[:message] 
  	mail(to: 'whatsgoodaroundme@gmail.com', subject: "WHATSGOOD:" + email[:subject])
  end

  def contact_confirm(email)
  	@name = email[:name]
  	mail(to: email[:email], subject: "whatsgood.")
  end
end
