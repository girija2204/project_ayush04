class ProfilesController < ApplicationController
	def show
		@user = User.find(params[:id])
	end
	def show_comms
		@title = "Communities"
		@user = User.find(params[:id])
		@comms = @user.comms
  	end
end
