class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :name_family_name, :name_first_name, :name_family_name_kana, :name_first_name_kana, :birthday])
  end
end
