class UsersController < ApplicationController
	skip_before_filter :authenticate
	def new
	  @user = User.new
	end

	def create
	  @user = User.new(params[:user])
	  # raise @user.inspect
	  if @user.save
	  	UserMailer.verify_email(@user).deliver
	    redirect_to root_url, :notice => "Signed up! confirm via email"
	  else
	    render "new"
	  end
	end
end
