# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  filter_parameter_logging :password
  
  before_filter :prepare_for_iphone
    
  def authorize
    if session[:user_id]
      @user = User.find(session[:user_id])
    else
      redirect_to login_url()
    end
  end
  
  def iphone?
    request.user_agent =~ /Mobile|webOS/
  end
  
  def prepare_for_iphone
    request.format = :iphone if iphone?
  end
  
end
