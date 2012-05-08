class Discussion < ActiveRecord::Base
  attr_accessible :title
  belongs_to :imageable, :polymorphic => true
end
