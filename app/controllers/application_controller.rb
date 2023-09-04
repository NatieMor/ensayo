class ApplicationController < ActionController::Base
    include Pagy::Backend
    Pagy::DEFAULT[:items] = 5

    before_action :configure_permitted_parameters, if: :devise_controller?
    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :phone, :address])
        devise_parameter_sanitizer.permit(:account_update, keys: [:name, :phone, :address])
    end
    
    def after_sign_in_path_for(resource)
        clients_path
    end  

    def authorize_request(kind = nil)
        unless kind.include?(current_user.role)
            redirect_to  clients_path, notice: "no estas autorizado para realizar esta acción"
        end
    end
end
