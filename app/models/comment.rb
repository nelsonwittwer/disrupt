class Comment < ActiveRecord::Base
  attr_accessible :text, :parent_id
  belongs_to :imageable, :polymorphic => true
  has_ancestry
end
