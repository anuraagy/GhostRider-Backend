class Event < ApplicationRecord
  has_many :ghosts
  has_many :participants, :through => :ghosts, :source => :user

  def creator
    User.find(creator_id)
  end
end
