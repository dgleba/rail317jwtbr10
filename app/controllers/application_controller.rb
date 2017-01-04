class ApplicationController < ActionController::Base
before_filter :authenticate_user!

  # Be sure to enable JSON.
  respond_to :html, :json
  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  protect_from_forgery with: :null_session
  
  #  protect_from_forgery with: :exception
end
