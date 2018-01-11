class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :ghosts
  has_many :events, :through => :ghosts

  has_many :achievement_records
  has_many :achievements, :through => :achievement_records
  
  validates :name,   :presence => true
  validates :age,    :presence => true
  validates :weight, :presence => true 
  validates :height, :presence => true 
end
