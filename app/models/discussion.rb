class Discussion < ActiveRecord::Base
  attr_accessible :title, :topic_id
  belongs_to :imageable, :polymorphic => true
  belongs_to :topic
  has_many :comments, :as => :imageable
  validates :title, :topic_id, :presence => true
  validates :title, :uniqueness => true



end
