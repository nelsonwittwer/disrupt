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
  attr_accessible :crunchbase, :description, :name, :logos_attributes, :screenshots_attributes, :twitter, :url, :tag_ids, :market_ids
  validates :name, :url, :description, :presence => true
  validates :name, :url, :uniqueness => true
  
  
  has_many :logos, :class_name => "Image", :as => :imageable, :dependent => :destroy
  has_many :screenshots, :class_name => "Image", :as => :imageable, :dependent => :destroy
  accepts_nested_attributes_for :logos
  accepts_nested_attributes_for :screenshots

  has_many :discussions, :dependent => :destroy, :as => :imageable
  has_many :taggings, :dependent => :destroy
  has_many :tags, :through => :taggings

 


end
