class Ghost < ApplicationRecord
  belongs_to :user
  belongs_to :event, :optional => true

  has_many :posts, :as => :postable
end
