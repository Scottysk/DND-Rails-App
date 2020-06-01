class CommentsController < ApplicationController
	before_action :redirect_if_not_logged_in

	def new
		if params[:character_id] && @character = Character.find_by_id(params[:character_id])
			@comment = @character.comments.build
		else
			@error = "This page doesn't exist" if params[:character_id]
			@comment = Comment.new
		end
	end



	def create
		@comment = current_user.comments.build(comment_params)
    if @comment.save
      redirect_to characters_path(@character)
    else
      redirect_back fallback_location: root_path
    end
  end



	# def destroy
	#	@character = Character.find(params[:character_id])
	#	@comment = @character.comments.find(params[:id])
	#	@comment.destroy
	#	redirect_to character_path(@character)
	# end

	def show
		if params[:character_id] && @character = Character.find_by_id(params[:character_id])
			@comments = @character.comments
		else
			redirect_to character_path
		end
	end


	private

	def comment_params
		params.require(:comment).permit(:content, :character_id)
	end
end
