class SessionsController < ApplicationController
  layout "default"
  
  def new
    @user = User.new()
  end
  
  def create
    reset_session
    @user = User.new(params[:user])
    logged_in = @user.login
    
    respond_to do |format|
      if logged_in
        session[:user_id] = logged_in.id
        format.html {redirect_to root_url}
      else
        flash[:notice] = "Incorrect username/password!"
        format.html {redirect_to login_url()}
      end
    end
  end
  
  def destroy
    reset_session
    
    respond_to do |format|
      format.html {redirect_to root_url}
    end
  end
  
end
