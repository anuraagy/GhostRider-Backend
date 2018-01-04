class Event < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :ghosts

  def creator
    User.find(creator_id)
  end
end
