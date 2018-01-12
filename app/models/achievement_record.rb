class AchievementRecord < ApplicationRecord
  belongs_to :user
  belongs_to :achievement

  has_many :posts, :as => :postable

  validates :achievement_id, :uniqueness => { :scope => :user_id }
end
