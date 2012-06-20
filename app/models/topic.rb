class Topic < ActiveRecord::Base
  attr_accessible :icon, :name
  has_many :discussions
end
