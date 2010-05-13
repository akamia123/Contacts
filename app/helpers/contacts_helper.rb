module ContactsHelper
  
  def company_value
    if @contact
      @contact.company_id
    elsif params[:company_id]
      params[:company_id].to_i
      #Company.find(params[:company_id]).id
    else
      "hlhjk"
    end
  end
  
end
