class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  
  def current_hospital
    @current_hospital ||= Hospital.find(session[:hospital_id]) rescue {}
  end
  helper_method :current_hospital

end
