class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    stored_location_for(resource) ||
      if resource.is_a?(Admin) && resource.can_publish?
        admin_tests_path
      else
        super
      end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,keys: [:email,
                                              :first_name,
                                              :last_name,
                                              :password,
                                              :password_confirmation])
  end
end
