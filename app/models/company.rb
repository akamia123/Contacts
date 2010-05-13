require "open-uri"
class Company < ActiveRecord::Base
  has_many :contacts
  
  has_attached_file :logo, :styles => {:small => ["x50", :jpg], :medium => ["x100", :jpg]}
  acts_as_taggable
  
  validates_presence_of :name
  validates_presence_of :city
  validates_presence_of :state
  validates_uniqueness_of :name
  
  def quote
    q = []
    open("http://finance.yahoo.com/d/quotes.csv?s=#{self.stock_symbol}&f=l1c1") do |f|
      f.each do |line|
        q = line.strip.split(",")
      end
    end
    q
  end
  
end
