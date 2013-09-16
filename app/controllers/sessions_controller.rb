class SessionsController < ApplicationController
	skip_before_filter :authenticate
  	def new
	end

	def create
	  user = User.authenticate(params[:email], params[:password])
	  # raise user.inspect
	  if user && user.verified
	    session[:user_id] = user.id
	    redirect_to root_url, :notice => "Logged in!"
	  else
	  	flash[:notice] = user.nil? ? "Email not verified." : "Invalid email or password"
	    render action: "new"
	  end
	end

	def destroy
	  session[:user_id] = nil
	  redirect_to root_url, :notice => "Logged out!"
	end

	def verification
	  	user = User.verify_email(params[:email_token])
	  	# raise params.inspect
	  	if user
	  		flash[:notice] = "Email verified."  
	  		redirect_to log_in_path
	  	else
	  		flash.now[:notice] = "Email not verified."
	  		redirect_to sign_up_path
	  	end
  	end
end

