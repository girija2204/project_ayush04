class CommentsController < ApplicationController
	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.build(comment_params)
		@comment.user = current_user
		if @comment.save
			respond_to do |format|
				format.html { redirect_to @post }
				format.js # render comments/create.js.erb
			end
		end
	end

	private
	def comment_params
		params.require(:comment).permit(:content)
	end
end
