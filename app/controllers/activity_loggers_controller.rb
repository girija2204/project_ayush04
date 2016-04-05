class ActivityLoggersController < ApplicationController
	def new
		
	end
	def create
		@user = current_user
		@activity = @user.activity_loggers.new(activity_params)
		if @activity.activity_type == "walking" || @activity.activity_type == "running"
			@activity.activity_measures = "distance"
		elsif @activity.activity_type == "exercise"
			@activity.activity_measures = "time"
		elsif @activity.activity_type == "rice intake"
			@activity.activity_measures = "grams"
		elsif @activity.activity_type == "cold drinks"
			@activity.activity_measures = "ml"
		elsif @activity.activity_type == "coffee or tea"
			@activity.activity_measures = "cups"
		elsif @activity.activity_type == "Alchohol Intake"
			@activity.activity_measures = "ml"
		elsif @activity.activity_type == "Cigarettes Intake"
			@activity.activity_measures = "number"
		elsif @activity.activity_type == "Water Intake"
			@activity.activity_measures = "ml"
		elsif @activity.activity_type == "Sleep Time"
			@activity.activity_measures = "time"
		elsif @activity.activity_type == "Day Active"
			@activity.activity_measures = "rating"
		elsif @activity.activity_type == "oil intake"
			@activity.activity_measures = "status"
		end
		if @activity.save
			redirect_to add_logger_path(current_user)
		else
			render new
		end
	end
	def show
		@activities = current_user.activity_loggers.order("created_at DESC").limit(10)
	end

	private
	def activity_params
		params.require(:activity_logger).permit(:activity_date, :activity_type, :quantities, :hours, :min, :distance)
	end
end
