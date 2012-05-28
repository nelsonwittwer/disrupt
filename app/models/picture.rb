class Picture < ActiveRecord::Base
  attr_accessible :url, :picture, :remote_picture_url
  belongs_to :startup


  mount_uploader :url, PictureUploader
end
