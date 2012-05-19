class Startup < ActiveRecord::Base
  attr_accessible :crunchbase, :description, :name, :screenshot, :twitter, :url, :market_ids,  :remote_logo_url, :logo
  validates :name, :url, :description, :presence => true
  validates :name, :url, :uniqueness => true
  
  
  mount_uploader :logo, LogoUploader
  has_many :discussions, dependent: :destroy, :as => :imageable
end
