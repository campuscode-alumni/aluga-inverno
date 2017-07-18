class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected

  def configure_permitted_parameters
    if resource_class == Owner
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:phone])
    end
  end

end
