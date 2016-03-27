class RelationshipsController < ApplicationController
	def create
		@user = User.find(params[:relationship][:followed_id])
		current_user.follow(@user)
		respond_to do |format|
			format.html { redirect_to profile_path(@user.id) }
			format.js
		end
	end
	def destroy
		@user = Relationship.find(params[:id]).followed
		current_user.unfollow(@user)
		respond_to do |format|
			format.html { redirect_to profile_path(@user.id) }
			format.js
		end
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
