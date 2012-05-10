class Discussion < ActiveRecord::Base
  attr_accessible :title
  belongs_to :imageable, :polymorphic => true
  has_many :comments, :as => :commentable

end
