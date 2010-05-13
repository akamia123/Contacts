module TelephonesHelper

  def area_code
    @telephone.number.split("")[0..2].join("")
  end
  
  def number1
    @telephone.number.split("")[3..5].join("")
  end
  
  def number2
    @telephone.number.split("")[6..9].join("")
  end
end
