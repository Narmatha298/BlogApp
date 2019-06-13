class UserNotifierMailer < ApplicationMailer
	include SessionsHelper
	default :from => 'narmathats298@gmail.com'

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_signup_email(user)
    @user = user
    mail( :to => @user.email,
    :subject => 'Thanks for signing up for our amazing app' )
   
  end

  def send_like_email(article,c_user)
  	@user = article.user
  	@c_user = c_user
  	@article = article
    mail( :to => @user.email,
    :subject => 'Someone liked your article' )
end

end
