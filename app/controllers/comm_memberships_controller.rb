class CommMembershipsController < ApplicationController
  def create
  	@comm = Community.find(params[:comm_membership][:comm_id])
  	#puts @comm_id
  	@comm.join(current_user)
  	respond_to do |format|
  		format.html { redirect_to @comm }
  		format.js
  	end
  end

  def destroy
  	@comm = Community.find(params[:comm_membership][:comm_id])
  	@user = CommMembership.find(params[:id]).member
  	@comm.leave(@user)
  	respond_to do |format|
  		format.html { redirect_to @comm }
  		format.js
  	end
  end
end
