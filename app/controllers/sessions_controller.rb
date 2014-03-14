class SessionsController < ApplicationController
	def create
	  user = login(params[:email], params[:password])
	  if user
	  	if session[:return_to_specsheet]
	  		redirect_to session[:return_to_specsheet]
	  		session[:return_to_specsheet] = nil
	  	else
	  		redirect_to user_path(@user), :notice => "Logged in!"
	  	end
	  else
	    flash.now.alert = "Email or password was invalid"
	    render :new
	  end
	end

	def destroy
	  logout
	  redirect_to root_url, :notice => "Logged out!"
	end
end
