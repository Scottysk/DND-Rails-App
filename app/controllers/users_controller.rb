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
			flash[:message] = "Invalid username or username is taken."
			render :new
		end
	end

	def index
		@users = User.all
	end


	def show
		redirect_if_not_logged_in
		@user = User.find_by_id(params[:id]) 
		redirect_to '/' if !@user
	end

	private

	def user_params
		params.require(:user).permit(:username, :password)
	end


end
