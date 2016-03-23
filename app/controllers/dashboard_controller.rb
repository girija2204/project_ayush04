class DashboardController < ApplicationController
	def show
		@post = Post.new
		@posts = Post.all
		@comment = @post.comments.new
		@comments = @post.comments
	end
end
