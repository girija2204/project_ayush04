class DashboardController < ApplicationController
	def show
		@user = User.find(params[:id])
		@user_posts = @user.posts
		@user.followed_users.each do |followed_user|
			@followed_user_posts = followed_user.posts
			#puts @followed_user_posts
			@user_posts = @followed_user_posts + @user_posts
		end
		@posts = @user_posts.reverse
	end
		#puts @posts
		#@posts = posts.all.order("created_at DESC")
		#end
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
