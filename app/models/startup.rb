class Startup < ActiveRecord::Base
  attr_accessible :crunchbase, :description, :name, :screenshot, :twitter, :url, :tag_ids, :market_ids,  :remote_logo_url, :logo
  validates :name, :url, :description, :presence => true
  validates :name, :url, :uniqueness => true
  
  
  has_one :logo, :class_name => "Picture", :as => :imageable, :dependent => :destroy
  has_many :discussions, :dependent => :destroy, :as => :imageable
  has_many :taggings, :dependent => :destroy
  has_many :tags, :through => :taggings
  has_many :pictures, :dependent => :destroy

 


end
