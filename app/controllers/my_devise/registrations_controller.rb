class MyDevise::RegistrationsController < Devise::RegistrationsController



	private
		def commitee_params
			     params.require(:user).permit(:email, :password, :password_confirmation, :login, :role_id)
		end
end
 protected
    def after_sign_up_path_for(resource)
      signed_in_root_path(resource)
    end

    def after_update_path_for(resource)
      signed_in_root_path(resource)
    end
end 