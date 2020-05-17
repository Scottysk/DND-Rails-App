class CharactersController < ApplicationController
	before_action :redirect_if_not_logged_in

	def new
		@character = Character.new
	end

	def create
		@character = current_user.characters.build(character_params)
		if @character.save
			redirect_to characters_path
		else
			render :new
		end
	end

	def index
		@characters = current_user.characters
	end

	def show
		@comments = Comment.find(params[:id])
		@character = Character.find(params[:id]) 
	end

	def edit
		@character = Character.find(params[:id])

		if current_user.id == @character.user_id
		else
			redirect_to character_path
		end
	end

	def update
		@character = Character.find(params[:id])
		@character.update(character_params)
		redirect_to character_path
	end



	private

	def character_params
		params.require(:character).permit(:name, :gender, :race, :profession)
	end
	
end
