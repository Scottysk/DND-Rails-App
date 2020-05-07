class UsersController < ApplicationController

	def new

	end

	def create
		@user = User.new
		@user.username = params[:username]
		@user.save

		redirect_to "/login"
	end

	
end
