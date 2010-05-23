class ContactsController < ApplicationController
  before_filter :authorize
  layout "default"
  
  def index
    if params[:tag]
      @contacts = @user.contacts.tagged_with(params[:tag])
    else  
      @contacts = @user.contacts
    end
    @contacts = @contacts.paginate(:all, :page => params[:page], :per_page => 10, :order => "last_name, first_name, mi")
    
    respond_to do |format|
      format.html
      format.iphone
      format.xml {render :xml => @contacts}
    end
  end
  
  def show
    @contact = Contact.find(params[:id])
    
    respond_to do |format|
      format.html
      format.iphone
      format.xml {render :xml => @contact.to_xml(:include => [:emails, :telephones, :addresses])}
    end
  end
  
  def search
    @contacts = Contact.search(params[:contact_query], :page => params[:page], :per_page => 10)
    
    respond_to do |format|
      format.html
      format.xml {render :xml => @contacts}
    end
  end
  
  def new
    @contact = Contact.new()
  end
  
  def create
    @contact = @user.contacts.new(params[:contact])
    if @company
      @contact.company_id = @company.id
    end
    
    respond_to do |format|
      if @contact.save
        format.html {redirect_to contact_url(@contact)}
        format.xml  {render :xml => @contact}
      else
        format.html {render :action => "new"}
        format.xml  {render :xml => @contact.errors, :status => :unprocessable_entity}
      end
    end
  end
  
  def edit
    @contact = @user.contacts.find(params[:id])
  end
  
  def update
    @contact = @user.contacts.find(params[:id])
    
    respond_to do |format|
      if @contact.update_attributes(params[:contact])
        format.html {redirect_to contact_url(@contact)}
        format.xml  {render :nothing => true}
      else
        format.html {render :action => "edit"}
        format.xml  {render :xml => @contact.errors, :status => :unprocessable_entity}
      end
    end
  end
  
  def destroy
    @contact = @user.contacts.find(params[:id])
    @contact.destroy
    
    respond_to do |format|
      format.html {redirect_to contacts_url()}
      format.xml  {render :nothing => true}
    end
  end
  
  private
  def check_company
    if params[:company_id]
      @company = Company.find(params[:company_id])
    end
  end

end
