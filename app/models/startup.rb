# == Schema Information
#
# Table name: startups
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  url         :string(255)
#  twitter     :string(255)
#  crunchbase  :string(255)
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Startup < ActiveRecord::Base
  attr_accessible :crunchbase, :description, :name, :screenshot, :startup_logo, :twitter, :url, :tag_ids, :market_ids
  validates :name, :url, :description, :presence => true
  validates :name, :url, :uniqueness => true
  
  
  

  has_many :discussions, :dependent => :destroy, :as => :imageable
  has_many :taggings, :dependent => :destroy
  has_many :tags, :through => :taggings


  has_attached_file :screenshot#,
  # :storage => :s3,
  #  :s3_credentials => {
  #   :access_key_id => ENV['S3_KEY'],
  #   :secret_access_key => ENV['S3_SECRET']},
  # :bucket => ENV['S3_BUCKET'],  
  #  :path => "/images/screenshots/:filename"
  has_attached_file :startup_logo#,
  # :storage => :s3,
  #  :s3_credentials => {
  #   :access_key_id => ENV['S3_KEY'],
  #   :secret_access_key => ENV['S3_SECRET']},
  # :bucket => ENV['S3_BUCKET'],
  #   :path => "/images/logos/:filename"
 
  


end
