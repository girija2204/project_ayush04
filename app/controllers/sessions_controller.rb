class Devise::SessionsController < DeviseController
  def create
		@user = User.find_by(email_id: params[:session][:email_id])
		
		if @user
			if @user.authenticate(params[:session][:password])
				sign_in(resource_name, resource)
				redirect_to dashboard_path(@user.id)
			end
		else
			flash.now[:error] = "Invalid email/password combination"
			render 'new'
		end
	end
end