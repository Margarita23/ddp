class ApplicationController < ActionController::Base
    before_action :authenticate_user!, except: :switch_locale
    before_action :configure_permitted_parameters, if: :devise_controller?

    def after_sign_in_path_for(resource)
        stored_location_for(resource) || board_index_path
    end

    def switch_locale
        locale = params[:lang] || I18n.default_locale
        I18n.locale = locale
        redirect_back fallback_location: root_path
    end

    protected

    def configure_permitted_parameters
    #    devise_parameter_sanitizer.for(:sign_up).push(:role)
    #    devise_parameter_sanitizer.for(:account_update).push(:role)
        devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
        devise_parameter_sanitizer.permit(:account_update, keys: [:role])
    end

end
