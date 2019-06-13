class SessionsController < ApplicationController

  before_action :set_no_cache
def set_no_cache
    response.headers['Cache-Control'] = 'no-cache, no-store,
                                        max-age=0, must-revalidate'
    response.headers['Pragma'] = 'no-cache'
    response.headers['Expires'] = '0'
  end

	def new
	end

	def create 
  		user = User.find_by(email: params[:session][:email].downcase)
  		#User.find_or_create_from_auth_hash(env["omniauth.auth"])
  		if user  && user.authenticate(params[:session][:password])
   			session[:user_id] = user.id
   			flash[:success] = "You have logged in"
   			redirect_to articles_path(user)
  		else
   			flash.now[:danger] = "There was something wrong with your login information"
   			render 'new'
 		 end
 	end

	def destroy
		log_out if logged_in?
		flash[:success] = "You have logged out"
		redirect_to root_path
	end

end
