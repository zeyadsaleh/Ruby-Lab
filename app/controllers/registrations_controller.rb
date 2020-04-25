class Users::RegistrationsController < Devise::RegistrationsController
    
    def sign_up_params
      params.require(:user).permit(:username, :encrypted_password, :email, :salt)
    end
end