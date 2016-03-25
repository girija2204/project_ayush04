class DashboardController < ApplicationController
	def show
		@user = User.find(params[:id])
		@post = @user.posts.new
		@posts = Post.all
		@comment = @post.comments.new
		@comments = @post.comments
	end
	def following
		@title = "Following"
		@user = User.find(params[:id])
		@users = @user.followed_users
	end
	def followers
		@title = "Followers"
		@user = User.find(params[:id])
		@users = @user.followers
	end
end
