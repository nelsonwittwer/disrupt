# == Schema Information
#
# Table name: topics
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  icon       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Topic < ActiveRecord::Base
  attr_accessible :name, :topic_icon
  has_many :discussions

  has_attached_file :topic_icon,
  :storage => :s3,
   :s3_credentials => {
    :access_key_id => ENV['S3_KEY'],
    :secret_access_key => ENV['S3_SECRET']},
  :bucket => ENV['S3_BUCKET'],  
   :path => "/images/topics/:filename"
end
