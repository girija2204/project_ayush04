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
			redirect_to add_logger_path#(current_user)
		else
			render new
		end
	end
	def day_logger
		activity_type = params[:activity_type]
		@current_activity = activity_type
		if activity_type == "all"
			@activities = current_user.activity_loggers
		elsif activity_type == "running"
			@activities = current_user.activity_loggers.where(activity_type: "running")
		elsif activity_type == "walking"
			@activities = current_user.activity_loggers.where(activity_type: "walking")
		elsif activity_type == "exercise"
			@activities = current_user.activity_loggers.where(activity_type: "exercise")
		elsif activity_type == "rice"
			@activities = current_user.activity_loggers.where(activity_type: "rice intake")
		elsif activity_type == "cold_drinks"
			@activities = current_user.activity_loggers.where(activity_type: "cold drinks")
		elsif activity_type == "coffee_or_tea"
			@activities = current_user.activity_loggers.where(activity_type: "coffee or tea")
		elsif activity_type == "alchohol"
			@activities = current_user.activity_loggers.where(activity_type: "Alchohol Intake")
		elsif activity_type == "cigarettes"
			@activities = current_user.activity_loggers.where(activity_type: "Cigarettes Intake")
		elsif activity_type == "water"
			@activities = current_user.activity_loggers.where(activity_type: "Water Intake")
		elsif activity_type == "sleep"
			@activities = current_user.activity_loggers.where(activity_type: "Sleep Time")
		elsif activity_type == "day_active"
			@activities = current_user.activity_loggers.where(activity_type: "Day Active")
		elsif activity_type == "oil"
			@activities = current_user.activity_loggers.where(activity_type: "oil intake")
		end
	end
	def week_logger
		activity_type = params[:activity_type]
		if activity_type == "all"
			@activities = current_user.activity_loggers
		elsif activity_type == "running"
			@activities = current_user.activity_loggers.where(activity_type: "running")
		elsif activity_type == "walking"
			@activities = current_user.activity_loggers.where(activity_type: "walking")
		elsif activity_type == "exercise"
			@activities = current_user.activity_loggers.where(activity_type: "exercise")
		elsif activity_type == "rice"
			@activities = current_user.activity_loggers.where(activity_type: "rice intake")
		elsif activity_type == "cold_drinks"
			@activities = current_user.activity_loggers.where(activity_type: "cold drinks")
		elsif activity_type == "coffee_or_tea"
			@activities = current_user.activity_loggers.where(activity_type: "coffee or tea")
		elsif activity_type == "alchohol"
			@activities = current_user.activity_loggers.where(activity_type: "Alchohol Intake")
		elsif activity_type == "cigarettes"
			@activities = current_user.activity_loggers.where(activity_type: "Cigarettes Intake")
		elsif activity_type == "water"
			@activities = current_user.activity_loggers.where(activity_type: "Water Intake")
		elsif activity_type == "sleep"
			@activities = current_user.activity_loggers.where(activity_type: "Sleep Time")
		elsif activity_type == "day_active"
			@activities = current_user.activity_loggers.where(activity_type: "Day Active")
		elsif activity_type == "oil"
			@activities = current_user.activity_loggers.where(activity_type: "oil intake")
		end
	end
	def month_logger
		activity_type = params[:activity_type]
		if activity_type == "all"
			@activities = current_user.activity_loggers
		elsif activity_type == "running"
			@activities = current_user.activity_loggers.where(activity_type: "running")
		elsif activity_type == "walking"
			@activities = current_user.activity_loggers.where(activity_type: "walking")
		elsif activity_type == "exercise"
			@activities = current_user.activity_loggers.where(activity_type: "exercise")
		elsif activity_type == "rice"
			@activities = current_user.activity_loggers.where(activity_type: "rice intake")
		elsif activity_type == "cold_drinks"
			@activities = current_user.activity_loggers.where(activity_type: "cold drinks")
		elsif activity_type == "coffee_or_tea"
			@activities = current_user.activity_loggers.where(activity_type: "coffee or tea")
		elsif activity_type == "alchohol"
			@activities = current_user.activity_loggers.where(activity_type: "Alchohol Intake")
		elsif activity_type == "cigarettes"
			@activities = current_user.activity_loggers.where(activity_type: "Cigarettes Intake")
		elsif activity_type == "water"
			@activities = current_user.activity_loggers.where(activity_type: "Water Intake")
		elsif activity_type == "sleep"
			@activities = current_user.activity_loggers.where(activity_type: "Sleep Time")
		elsif activity_type == "day_active"
			@activities = current_user.activity_loggers.where(activity_type: "Day Active")
		elsif activity_type == "oil"
			@activities = current_user.activity_loggers.where(activity_type: "oil intake")
		end
	end
	def calendar_logger
		activity_type = params[:activity_type]
		if activity_type == "all"
			@activities = current_user.activity_loggers
		elsif activity_type == "running"
			@activities = current_user.activity_loggers.where(activity_type: "running")
		elsif activity_type == "walking"
			@activities = current_user.activity_loggers.where(activity_type: "walking")
		#elsif activity_type == "exercise"
			#@activities = current_user.activity_loggers.where(activity_type: "exercise")
		elsif activity_type == "rice"
			@activities = current_user.activity_loggers.where(activity_type: "rice intake")
		elsif activity_type == "cold_drinks"
			@activities = current_user.activity_loggers.where(activity_type: "cold drinks")
		elsif activity_type == "coffee_or_tea"
			@activities = current_user.activity_loggers.where(activity_type: "coffee or tea")
		elsif activity_type == "alchohol"
			@activities = current_user.activity_loggers.where(activity_type: "Alchohol Intake")
		elsif activity_type == "cigarettes"
			@activities = current_user.activity_loggers.where(activity_type: "Cigarettes Intake")
		elsif activity_type == "water"
			@activities = current_user.activity_loggers.where(activity_type: "Water Intake")
		#elsif activity_type == "sleep"
			#@activities = current_user.activity_loggers.where(activity_type: "Sleep Time")
		elsif activity_type == "day_active"
			@activities = current_user.activity_loggers.where(activity_type: "Day Active")
		#elsif activity_type == "oil"
			#@activities = current_user.activity_loggers.where(activity_type: "oil intake")
		end
		@activities_by_date = @activities.group_by(&:activity_date)
		@date = params[:date] ? Date.parse(params[:date]) : Date.today
	end

	private
	def activity_params
		params.require(:activity_logger).permit(:activity_date, :activity_type, :quantities, :hours, :min, :distance)
	end
end
