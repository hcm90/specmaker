class UsersController < ApplicationController
	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
        	auto_login(@user)
        	if session[:return_to_specsheet]
        		redirect_to session[:return_to_specsheet]
        		session[:return_to_specsheet] = nil
        	else
        		redirect_to user_path(@user), :notice => "Signed Up!"
        	end
      	else
        	render :new
      end
	end

	private
	def user_params
	  params.require(:user).permit(:email, :password, :salt)
	end

end