class Startup < ActiveRecord::Base
  attr_accessible :crunchbase, :description, :name, :screenshots_attributes, :twitter, :url, :tag_ids, :market_ids,  :remote_logo_url, :logo
  validates :name, :url, :description, :presence => true
  validates :name, :url, :uniqueness => true
  
  
  has_one :logo, :class_name => "Image", :as => :imageable, :dependent => :destroy
  has_many :screenshots, :class_name => "Image", :as => :imageable, :dependent => :destroy
  accepts_nested_attributes_for :screenshots

  has_many :discussions, :dependent => :destroy, :as => :imageable
  has_many :taggings, :dependent => :destroy
  has_many :tags, :through => :taggings

 


end
