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
  def user_join
    @comm = Community.find(params[:id])
    @user = current_user
    if @comm.memberships.build(@user)
      redirect_to @comm
    end
  end
  def user_leave
    @comm = Community.find(params[:id])
    @user = current_user
    @comm.memberships.find_by(@user).destroy
  end
  def show
  	@comm = Community.find(params[:id])
  	@discs = @comm.discussions
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
  def about_comm
    @title = "About Community"
    @comm = Community.find(params[:id])
  end
  def update
    @comm = Community.find(params[:id])
    @comm.update(comm_params)
    redirect_to about_comm_path
  end

  private
  def comm_params
  	params.require(:community).permit([:c_name, :description])
  end
end
