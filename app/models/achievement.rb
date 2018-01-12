class Achievement < ApplicationRecord
  has_many :achievement_records
  has_many :users, :through => :achievement_records
  
  validates :name,        :presence => true
  validates :description, :presence => true
  validates :image_url,   :presence => true
end
