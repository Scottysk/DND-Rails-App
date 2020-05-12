class CharactersController < ApplicationController

	def new
		@character = Character.new
	end

	def create
		@character = Character.new(character_params)
		if @character.save
			redirect_to characters_path
		else
			render :new
		end
	end

	def index
	end

	private

	def post_params
		params.require(:character).permit(:name, :gender, :race, :profession)

	
end
