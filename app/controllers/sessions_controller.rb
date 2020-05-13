class SessionsController < ApplicationController

	def home
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

		#elsif  auth = request.env["omniauth.auth"]
		#	@user = User.find_or_create_by_omniauth(auth)
      	#	session[:user_id] = @user.id
      	#	redirect_to root_path

		else request.env['omniauth.auth']
		end
	end

	def omniauth
		@user = User.find_or_create_by(username: auth[:info][:email]) do |u|
		u.password = SecureRandom.hex
		end
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
