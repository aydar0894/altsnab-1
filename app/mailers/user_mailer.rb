class UserMailer < ApplicationMailer

	default from: 'noreply@altsnab.com'

	layout "mailer"
	def mailer(user, pass)
	    @user = user
	    @pass = pass
	    @url  = 'http://example.com/login'
	    mail(to: @user.email, subject: "#{user} is yours")
 	end
end
