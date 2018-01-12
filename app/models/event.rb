class Event < ApplicationRecord
  has_many :ghosts
  has_many :participants, :through => :ghosts, :source => :user

  has_many :posts, :as => :postable

  def creator
    User.find(creator_id)
  end
end
