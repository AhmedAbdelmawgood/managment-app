class RegistrationsController < Devise::RegistrationsController
	
	
	private

	def sign_up_params
		params.require(:user).permit(:name, :age, :password, :email, :password_confirmation)
	end
	def account_update_params
		params.require(:user).permit(:name, :age, :password, :email,:current_password, :password_confirmation)
	end
end