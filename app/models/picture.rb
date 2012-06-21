class Picture < ActiveRecord::Base
  belongs_to :imageable, :polymorphic => true
  attr_accessible :pic_file_name
  has_attached_file :pic_file_name
end