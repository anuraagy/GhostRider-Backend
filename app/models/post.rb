class Post < ApplicationRecord
  belongs_to :postable, :polymorphic => true
  belongs_to :user

  validates :likes, :numericality => { :greater_than_or_equal_to => 0 }
end
