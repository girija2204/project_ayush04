class DiscussionsController < ApplicationController
	def create
		@comm = Community.find(params[:comm_id])
		puts @comm.id
		@disc = @comm.discussions.create(disc_params)
		@disc.user = current_user
		if @disc.save
			redirect_to comm_path(@comm)
		else
			render 'new'
		end
	end
	def show
		@disc = Discussion.find(params[:id])
		@comm = @disc.community
		@dcomments = @disc.d_comments
		#puts @disc
	end

	private
	def disc_params
		params.require(:discussion).permit(:content)
	end
end
