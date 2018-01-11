class AchievementRecord < ApplicationRecord
  belongs_to :user
  belongs_to :achievement

  validates :achievement_id, :uniqueness => { :scope => :user_id }
end
