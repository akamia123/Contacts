class EmailsController < ApplicationController
  before_filter :get_contact
  layout "default"
  
  def new
    @email = Email.new()
  end
  
  def create
    @email = @contact.emails.new(params[:email])
    
    respond_to do |format|
      if @email.save
        format.html {redirect_to contact_url(@contact)}
      else
        format.html {render :action => "new"}
      end
    end
  end
  
  def edit
    @email = @contact.emails.find(params[:id])
  end
  
  def update
    @email = @contact.emails.find(params[:id])
    
    respond_to do |format|
      if @email.update_attributes(params[:email])
        format.html {redirect_to contact_url(@contact.id)}
        format.xml  {render :nothing => true}
      else
        format.html {render :action => "edit"}
        format.xml  {render :xml => @email.errors, :status => :unprocessable_entity}
      end
    end
  end
  
  def destroy
    @email = @contact.emails.find(params[:id])
    @email.destroy
    
    respond_to do |format|
      format.html {redirect_to contact_url(@contact.id)}
      format.xml  {render :nothing => true}
    end
  end
  
  private
  def get_contact
    @contact = Contact.find(params[:contact_id])
  end
end
