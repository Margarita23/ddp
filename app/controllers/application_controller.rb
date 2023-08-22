class ApplicationController < ActionController::Base
    before_action :authenticate_user!, except: :switch_locale

    def after_sign_in_path_for(resource)
        stored_location_for(resource) || board_index_path
    end

    def switch_locale
        locale = params[:lang] || I18n.default_locale
        I18n.locale = locale
        redirect_back fallback_location: root_path
    end

end
