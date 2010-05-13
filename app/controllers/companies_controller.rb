class CompaniesController < ApplicationController
  before_filter :authorize
  layout "default"
  def index
    @companies = Company.paginate(:all, :page => params[:page], :order => "name", :per_page => 10)
    
    respond_to do |format|
      format.html
      format.xml {render :xml => @companies}
    end
  end
  
  def show
    @company = Company.find(params[:id])
    @contacts = @company.contacts.by_user(@user.id).paginate(:page => params[:page], :per_page => 10)
    
    respond_to do |format|
      format.html
      format.xml {render :xml => @company.to_xml(:include => :contacts)}
    end
  end
  
  def new
    @company = Company.new()
  end
  
  def create
    @company = Company.new(params[:company])
    
    respond_to do |format|
      if @company.save
        format.html {redirect_to company_url(@company)}
        format.xml  {render :xml => @company}
      else
        format.html {render :action => "new"}
        format.xml  {render :xml => @company.errors, :status => :unprocessable_entity}
      end
    end
  end
  
  def edit
    @company = Company.find(params[:id])
  end
  
  def update
    @company = Company.find(params[:id])
    
    respond_to do |format|
      if @company.update_attributes(params[:company])
        format.html {redirect_to company_url(@company)}
        format.xml  {render :nothing => true}
      else
        format.html {render :action => "edit"}
        format.xml  {render :xml => @company.errors, :status => :unprocessable_entity}
      end
    end
  end
  
  def destroy
    @company = Company.find(params[:id])
    @company.destroy
    
    respond_to do |format|
      format.html {redirect_to companies_url()}
      format.xml  {render :nothing => true}
    end
  end
  
  
end
