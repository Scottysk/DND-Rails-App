module CommentsHelper

def comments_visibility
	if @user.comments.empty?
			tag.h3(link_to("You have no comments yet. Visit a character's page to comment on them!"))
	else



end



end

end
