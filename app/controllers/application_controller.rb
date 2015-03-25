class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :authenticate_user!  
  helper_method :current_subject
  
  def current_subject
    Subject.find_by_id(session[:current_subject])
  end
end
