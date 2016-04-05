class DashboardController < ApplicationController
	def show
		@user = User.find(params[:id])
		@posts = Post.all.order("created_at DESC")
	end
	def show_comms
		@title = "Communities"
		@user = User.find(params[:id])
		@comms = @user.comms
  	end
	def members
  		@comm = Community.find(params[:id])
  		@members = @comm.members
  	end
end
