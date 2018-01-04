class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_and_belongs_to_many :events
  has_many :ghosts
  
  validates :name,   :presence => true
  validates :age,    :presence => true
  validates :weight, :presence => true 
  validates :height, :presence => true 
end
