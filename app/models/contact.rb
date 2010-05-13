class Contact < ActiveRecord::Base
  belongs_to :user
  belongs_to :company
  has_many :telephones
  has_many :addresses
  has_many :business_cards
  has_many :emails
  
  has_attached_file :picture, :styles => {:small => ["100x100", :jpg], :medium => ["400x", :jpg]}
  
  acts_as_taggable_on :skills
  
  validates_presence_of :first_name
  validates_presence_of :last_name
  
  named_scope :by_user, lambda { |user_id| {:conditions => {:user_id => user_id}, :order => "last_name, first_name, mi"}}
end
