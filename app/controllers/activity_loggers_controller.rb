class ActivityLoggersController < ApplicationController
	def new
		
	end
	def create
		@user = current_user
		@activity = @user.activity_loggers.new(activity_params)
		if @activity.save
			redirect_to logger_path(current_user)
		else
			render new
		end
	end

	private
	def activity_params
		params.require(:activity_logger).permit(:activity_description, :activity_date, :activity_type, :hours, :min, :distance)
	end
end
