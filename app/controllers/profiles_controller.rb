class ProfilesController < ApplicationController
	def show
		@user = User.find(params[:id])
	end
	def show_comms
		@title = "Communities"
		@user = User.find(params[:id])
		@comms = @user.comms
  	end
  	def first_step
		@user = User.find(params[:id])
	end
	def save_attributes
		@user = User.find(params[:id])
		if @user.update(save_attr_params)
			redirect_to second_step_path(@user.id)
		end
	end
	def second_step
		@user = User.find(params[:id])
	end
	def final_save_attributes
		@user = User.find(params[:id])
		if @user.update(final_save_attr_params)
			redirect_to dashboard_path(@user.id)
		end
	end
	def about_me
		@user = User.find(params[:id])
	end
	def all_posts
		@user = User.find(params[:id])
	end
	def edu_details
		@user = User.find(params[:id])
	end
	def emp_details
		@user = User.find(params[:id])
	end

	private
	def save_attr_params
		params.require(:profile).permit(:first_name, :last_name, :gender, :dob, :bio)
	end
	def final_save_attr_params
		params.require(:profile).permit(:education_status, :work_status, :smoking, :drinking, :diabetes_status)
	end
end
