class UsersController < ApplicationController

	def new # GET /register
		if session[:current_user_id]
			redirect_to "/", :notice => "You are already logged in."
		end
	end

	def create
		@user = User.new
		@user.username = params[:username]
		@user.save

		redirect_to "/login"
	end


end
