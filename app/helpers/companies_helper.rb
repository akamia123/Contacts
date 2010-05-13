module CompaniesHelper
  
  def quote_color(change)
    if change.to_f < 0
      return "stock_down"
    else
      return "stock_up"
    end
  end
  
end
