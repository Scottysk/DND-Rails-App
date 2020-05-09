class SessionsController < ApplicationController

	def new
	end

	def create
		@user = User.find_by(:username => params[:username])
		if @user
			login(@user)
			redirect_to root_path
		else
			redirect_to login_path, :notice => "Invalid username or password."
		end
	end

	def destroy
		reset_seession
		redirect_to root_path
	end

end
