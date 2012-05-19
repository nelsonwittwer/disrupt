class Topic < ActiveRecord::Base
  attr_accessible :icon, :name
  has_many :discussions
  mount_uploader :icon, IconUploader
end
