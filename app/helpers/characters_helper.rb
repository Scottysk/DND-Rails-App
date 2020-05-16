module CharactersHelper

	def characters_visibility
		if @user.characters.empty?
			tag.h3(link_to('You have no characters yet. Create one here!', new_character_path))
		else



		end
	end



end
