class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :ghosts
  has_many :events, :through => :ghosts

  has_many :achievement_records
  has_many :achievements, :through => :achievement_records

  has_many :relationships
  has_many :inverse_relationships, :class_name => "Relationship", :foreign_key => :friend_id

  has_many :friends,   :through => :relationships
  has_many :followers, :through => :inverse_relationships, :source => :user

  has_many :posts
  has_many :friends_posts, :through => :friends, :source => :posts

  validates :name,   :presence => true
  validates :age,    :presence => true
  validates :weight, :presence => true 
  validates :height, :presence => true 
end
