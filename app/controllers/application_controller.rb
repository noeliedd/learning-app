class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :authenticate_user!  
  helper_method :current_subject, :current_topic, :current_quiz
  #include CheckProgress
  
  def current_subject
    Subject.find_by_id(session[:current_subject])
  end
  
  def current_topic
    Topic.find_by_id(session[:current_topic])
  end  
  
  def current_quiz
    Quiz.find_by_id(session[:current_quiz])
  end    
end
