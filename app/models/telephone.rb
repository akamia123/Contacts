class Telephone < ActiveRecord::Base
  belongs_to :contact
  
  attr_accessor :area_code, :number1, :number2
  
  def before_save
    self.number = self.area_code + self.number1 + self.number2
  end
  
end
