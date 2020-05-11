class UsersController < ApplicationController

	def new # GET /register
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id
			redirect_to login_path
		else
			render :new
		end
	end

	def show
		
	end

	private

	def user_params
		params.require(:user).permit(:username, :password)
	end


end
