class EduEmpDetailsController < ApplicationController
	def create_edu
		@user = current_user
		@edu = @user.educational_details.build(education_params)
		if @edu.save
			redirect_to edu_details_path(@user)
		else
			render new
		end
	end
	def create_emp
		@user = current_user
		@emp = @user.employment_details.build(employment_params)
		if @emp.save
			redirect_to emp_details_path(@user)
		else
			render new
		end
	end

	private
		def education_params
			params.require(:educational_details).permit(:school, :degree, :field_of_study, :grade, :description)
		end
		def employment_params
			params.require(:employment_details).permit(:organisation, :position_held, :location, :description)
		end
end
