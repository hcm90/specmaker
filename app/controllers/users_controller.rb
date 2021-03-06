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
        	redirect_to new_session_path, :notice => "Signed Up!"
      	else
        	render :new
      end
	end

	private
	def user_params
	  params.require(:user).permit(:email, :password, :salt)
	end

end