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


	def destroy
		session.clear
		redirect_to root_path
	end

	protected

	def auth_hash
		request.env['omniauth.auth']
	end


end
