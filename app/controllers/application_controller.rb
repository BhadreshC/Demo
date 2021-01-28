class ApplicationController < ActionController::Base
  # before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_admin!
  # before_action :set_time_zone
  private

  def set_time_zone
    puts current_admin.as_json
    puts "--------------set_time_zone-----------------"
    Time.zone = current_admin.in_time_zone if current_admin
    puts Time.zone
    puts "--------------set_time_zone_-----------------"
  end
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
