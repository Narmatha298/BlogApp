class UsersController < ApplicationController
	def new
		@user = User.new
	end
	
	def create
		@user = User.new(user_params)
		if @user.save
			UserNotifierMailer.send_signup_email(@user).deliver
			flash[:notice] = "Successfully created the new user"
			redirect_to login_path
		else
			render 'new'
		end
	end
	
	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			flash[:success] = "Updated"
			redirect_to articles_path
		else
			render 'edit'
		end
	end

	def show
		@user = User.find(params[:id])
	end

	def index
		@user = User.all
	end

	
 	def destroy
 		@user = User.find(params[:id])
 		@user.destroy
 			flash[:notice] = "Article was deleted successfully"
 			redirect_to users_path
 	end



	private
		def user_params
  			params.require(:user).permit(:name, :email, :password)
		end
end
