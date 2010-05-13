module ContactsHelper
  
  def company_value
    if params[:company_id]
      params[:company_id].to_i
    else
      @contact.company_id
    end
  end
  
end
