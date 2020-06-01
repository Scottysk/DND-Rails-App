class CharactersController < ApplicationController
	before_action :redirect_if_not_logged_in
	before_action :set_character, only: [:show, :edit, :update, :destroy]
	before_action :authorized?, only: [:edit, :update, :destroy]

	def new
		@character = Character.new
	end

	def create
		@character = current_user.characters.build(character_params)
		if @character.save
			flash[:created] = "Character successfully created!"
			redirect_to character_path(@character)
		else
			render :new
		end
	end

	def index
		@characters = Character.search(params[:search])
		# @characters = current_user.characters
	end

	def show
	end

	def edit
	end

	def update
		@character.update(character_params)
		redirect_to character_path(@character)
	end

	def destroy
		@character.destroy
		flash[:notice] = "Your character has been deleted."
		redirect_to characters_path
	end



	private

	def authorized?
		if current_user.id != @character.user_id
			redirect_to root_path
		end
	end

	def set_character
		@character = Character.find(params[:id]) 
	end

	def character_params
		params.require(:character).permit(:name, :gender, :race, :profession, :alignment, :background, :level, :conditions, :skills, :search, :character_id)
	end
	
end


      