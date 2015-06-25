class MyDevise::RegistrationsController < Devise::RegistrationsController



	private
		def commitee_params
			     params.require(:user).permit(:email, :password, :password_confirmation, :login, :role_id)
		end

end 