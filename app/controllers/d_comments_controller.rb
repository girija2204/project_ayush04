class DCommentsController < ApplicationController
	def create
		@disc = Discussion.find(params[:disc_id])
		@dcomment = @disc.d_comments.build(dcomms_params)
		@dcomment.community = @comm
		@dcomment.user = current_user
		if @dcomment.save
			respond_to do |format|
				format.html { redirect_to @disc }
				format.js
			end
		end
	end

	private
	def dcomms_params
		params.require(:d_comment).permit(:content)
	end
end
