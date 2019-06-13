module SessionsHelper



  def authenticate
    redirect_to :login unless logged_in?
  end
	def current_user
   		@current_user ||= User.find(session[:user_id]) if session[:user_id]
      rescue ActiveRecord::RecordNotFound
  	end

  	def logged_in?
   		!!current_user
  	end

  	def require_user
   		if !logged_in?
    		flash[:danger] = "You must be logged in to perform that action"
    		redirect_to root_path
   		end
  	end



    def log_out
      #forget(current_user)
      session.delete(:user_id)
      @current_user = nil
    end
end














