class AddressesController < ApplicationController
  before_filter :get_contact
  layout "default"
  
  def new
    @address = Address.new()
  end
  
  def create
    @address = @contact.addresses.new(params[:address])
    
    respond_to do |format|
      if @address.save
        format.html {redirect_to contact_url(@contact)}
      else
        format.html {render :action => "new"}
      end
    end
  end
  
  def edit
    @address = @contact.addresses.find(params[:id])
  end
  
  def update
    @address = @contact.addresses.find(params[:id])
    
    respond_to do |format|
      if @address.update_attributes(params[:address])
        format.html {redirect_to contact_url(@contact)}
        format.xml  {render :nothing => true}
      else
        format.html {render :action => "new"}
        format.xml  {render :xml => @address.errors, :status => :unprocessable_entity}
      end
    end
  end
  
  def destroy
    @address = @contact.addresses.find(params[:id])
    @address.destroy
    
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
