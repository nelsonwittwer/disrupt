class Picture < ActiveRecord::Base
  belongs_to :imageable, :polymorphic => true
  attr_accessible :url 
  has_attached_file :url

end