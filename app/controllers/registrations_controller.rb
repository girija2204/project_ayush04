class RegistrationsController < Devise::RegistrationsController
	def create
		@user = User.new(sign_up_params)
		if @user.save
			sign_up(resource_name, resource)
			#redirect_to dashboard_path(@user.id)
			redirect_to first_step_path(@user.id)
		end
	end

	protected

	def sign_up(resource_name, resource)
    	sign_in(resource_name, resource)
  	end

	private
	
	def sign_up_params
		params.require(:user).permit(:user_type, :email, :password, :password_confirmation)		
	end

	def account_update_params
		params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password)
	end
end