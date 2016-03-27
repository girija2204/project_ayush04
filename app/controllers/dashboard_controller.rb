class DashboardController < ApplicationController
	def show
		@user = User.find(params[:id])
		@posts = Post.all
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
