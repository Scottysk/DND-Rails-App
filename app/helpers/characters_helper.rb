module CharactersHelper

	def characters_visibility
		if @user.characters.empty?
			tag.h3(link_to('You have no characters yet. Create one here!', new_character_path))
		else

		end
	end

	def edit_visibility
			 @character.user == current_user 
			(button_to('Edit', edit_character_path))


	end



end
