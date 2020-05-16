class SessionsController < ApplicationController

	def home
	 	@characters = Character.all
	end

	def new
		@user = User.new
		render :login
	end

	def create
		@user = User.find_by(:username => params[:user][:username])
		if @user && @user.authenticate(params[:user][:password])
			session[:user_id] = @user.id
			redirect_to user_path(@user)
		else
			flash[:error] = "Invalid username or password"
			redirect_to login_path
		end
	end

	def omniauth
		@user = User.create_by_google_omniauth(auth)

		session[:user_id] = @user.id
		redirect_to user_path(@user)
	end


	def destroy
		session.clear
		redirect_to root_path
	end

	private

	def auth
		request.env['omniauth.auth']
	end


end
