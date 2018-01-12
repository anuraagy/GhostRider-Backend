class Post < ApplicationRecord
  belongs_to :postable, :polymorphic => true
  belongs_to :user

  validates :likes, :numericality => { :greater_than => 0 }
end
