class CharactersController < ApplicationController

	def new
		@character = Character.new
	end

	def create
		@character = user.characterrs.build(character_params)
		if @character.save
			redirect_to characters_path
		else
			render :new
		end
	end

	def index
	end

	private

	def character_params
		character.require(:character).permit(:name, :gender, :race, :profession)

	
end
