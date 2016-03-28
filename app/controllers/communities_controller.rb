class CommunitiesController < ApplicationController
  def new
  	@comm = Community.new
  end
  def create
  	@user = User.find_by(:id => current_user)
  	@comm = @user.communities.build(comm_params)
  	@comm.user = @user
  	if @comm.save
  		@comm.join(@user)
  		redirect_to @comm
  	else
  		render 'new'
  	end
  end
  def show
  	@comm = Community.find(params[:id])
  	@discs = Discussion.all
  end
  def discussion_form
  	@comm = Community.find(params[:id])
  end
  def show_comms
	@title = "Communities"
	@user = User.find(params[:id])
	@comms = @user.comms
  end
  def members
  	@title = "Members"
  	@comm = Community.find(params[:id])
  	@members = @comm.members
  end	 	

  private
  def comm_params
  	params.require(:community).permit([:c_name])
  end
end
