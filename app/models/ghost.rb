class Ghost < ApplicationRecord
  belongs_to :user
  belongs_to :event, :optional => true
end
