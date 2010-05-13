class UsersController < ApplicationController
  before_filter :authorize, :except => [:new, :create]
  layout "default"
  
  def show
    @contact_tags = @user.contacts.tag_counts_on(:skills)
  end
  
  def new
    @user = User.new()
  end
  
  def create
    @user = User.new(params[:user])
    
    respond_to do |format|
      if @user.save
        format.html {redirect_to root_url()}
        format.xml  {render :xml => @user}
      else
        format.html {render :action => "new"}
        format.xml  {render :xml => @user.errors, :status => :unprocessable_entity}
      end
    end
  end
  
  def edit
    @user = User.find(session[:user_id])
  end
  
  def update
    @user = User.find(session[:user_id])
    
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html {redirect_to root_url()}
        format.xml  {render :nothing => true}
      else
        format.html {render :action => "edit"}
        format.xml  {render :xml => @user.errors, :status => :unprocessable_entity}
      end
    end
  end
  
end
