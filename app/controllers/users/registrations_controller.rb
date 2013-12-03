class Users::RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters

  
protected
    def configure_permitted_parameters
       devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:first_name, :last_name, :profile_name, :email, :password, :password_confirmation, :avatar)}
       devise_parameter_sanitizer.for(:account_update) {|u| u.permit(:first_name, :last_name, :profile_name, :email, :password, :password_confirmation, :avatar, :current_password)}
    end
end