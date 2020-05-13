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

	private

	def character_params
		params.require(:character).permit(:name, :gender, :race, :profession)
	end
	
end
