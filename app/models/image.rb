# == Schema Information
#
# Table name: images
#
#  id                      :integer          not null, primary key
#  imageable_id            :integer
#  imageable_type          :string(255)
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  image_name_file_name    :string(255)
#  image_name_content_type :string(255)
#  image_name_file_size    :integer
#  image_name_updated_at   :datetime
#

class Image < ActiveRecord::Base
  attr_accessible :image_name
  belongs_to :imageable, :polymorphic => true
	
  validates :image_name, presence: true	

  has_attached_file :image_name,
   :storage => :s3, :s3_credentials => "#{Rails.root}/config/amazon_s3.yml",
   :path => "/images/:filename"
end
