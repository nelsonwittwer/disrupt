class Comment < ActiveRecord::Base
  attr_accessible :text, :parent_id, :user_id
  belongs_to :imageable, :polymorphic => true
  belongs_to :user
  has_ancestry
end
