class Startup < ActiveRecord::Base
  attr_accessible :crunchbase, :description, :name, :screenshot, :twitter, :url, :market_ids,  :remote_logo_url, :logo
  validates :name, :url, :description, :screenshot, :presence => true
  validates :name, :url, :uniqueness => true
  
  
  mount_uploader :logo, LogoUploader
  has_many :discussions, :as => :imageable
end
