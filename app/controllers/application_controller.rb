class ApplicationController < ActionController::Base
add_flash_types :info,:error,:warning,:success



    def configure_devise_parameters
        devise_parameter_sanitizer.permit(:sign_up) {|u| u.permit(:first_name, :last_name, :is_alive, :email, :password, :password_confirmation)}
        devise_parameter_sanitizer.permit(:account_update) {|u| u.permit(:first_name, :last_name, :description, :is_alive, :email, :password, :password_confirmation, :current_password)}
    end
    def after_sign_in_path_for(resource_or_scope)
        activities_path
    end
        
    def after_sign_out_path_for(resource_or_scope)
        activities_path
    end

    def authenticate_user
        unless user_signed_in?
            flash[:danger] = "Please log in."
            redirect_to new_user_session_path, flash: {danger: "Access restricted !"}
        end
    end
end
