class Startup < ActiveRecord::Base
  attr_accessible :crunchbase, :description, :name, :logo_id_attributes, :screenshots_attributes, :twitter, :url, :tag_ids, :market_ids
  validates :name, :url, :description, :presence => true
  validates :name, :url, :uniqueness => true
  
  
  has_one :logo_id, :class_name => "Image", :as => :imageable, :dependent => :destroy
  has_many :screenshots, :class_name => "Image", :as => :imageable, :dependent => :destroy
  accepts_nested_attributes_for :screenshots
  accepts_nested_attributes_for :logo_id

  has_many :discussions, :dependent => :destroy, :as => :imageable
  has_many :taggings, :dependent => :destroy
  has_many :tags, :through => :taggings

 


end
