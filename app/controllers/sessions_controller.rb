class SessionsController < ApplicationController

	def new
		@user = User.new
		render :login
	end

	def create
		@user = User.find_by(:username => params[:user][:username])
		if @user && @user.authenticate(params[:user][:password])
			session[:user_id] = @user.id
			#login(@user)
			redirect_to root_path
		else
			redirect_to root_path, :notice => "Invalid username or password."
		end
	end


	def destroy
		reset_session
		redirect_to root_path
	end


end
