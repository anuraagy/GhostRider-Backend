class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string  :title
      t.string  :description
      t.string  :image_url
      t.integer :likes, :default => 0

      t.references :postable, :polymorphic => true, :index => true

      t.belongs_to :user,  :index => true
      
      t.timestamps
    end
  end
end
