class TelephonesController < ApplicationController
  before_filter :get_contact
  layout "default"
  
  def new
    @telephone = Telephone.new()
  end
  
  def create
    @telephone = @contact.telephones.new(params[:telephone])
    
    respond_to do |format|
      if @telephone.save
        format.html {redirect_to contact_url(@contact)}
      else
        format.html {render :action => "new"}
      end
    end
  end
  
  def edit
    @telephone = @contact.telephones.find(params[:id])
  end
  
  def update
    @telephone = @contact.telephones.find(params[:id])
    
    respond_to do |format|
      if @telephone.update_attributes(params[:telephone])
        format.html {redirect_to contact_url(@contact)}
        format.xml  {render :nothing => true}
      else
        format.html {render :action => "edit"}
        format.xml  {render :xml => @telephone.errors, :status => :unprocessable_entity}
      end
    end
  end
  
  def destroy
    @telephone = @contact.telephones.find(params[:id])
    @telephone.destroy
    
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
