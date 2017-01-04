class ApplicationController < ActionController::Base
before_filter :authenticate_user!

  # Be sure to enable JSON.
  respond_to :html, :json
  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  protect_from_forgery with: :null_session
  
  #  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    # redirect_to :back, alert: exception.message
    redirect_to main_app.root_path, :alert => exception.message
  end
  
end
