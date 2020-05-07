class SessionsController < ApplicationController

	def new
	end

	def create
		@user = User.find_by(:username => params[:username])
		if @user
			redirect_to "/"
		else
			redirect_to "/login", :notice => "Invalid username or password."
	end
end

end
