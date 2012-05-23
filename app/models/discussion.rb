class Discussion < ActiveRecord::Base
  attr_accessible :title, :topic_id, :user_id
  belongs_to :imageable, :polymorphic => true
  belongs_to :topic
  belongs_to :user
  has_many :comments, :as => :imageable, :dependent => :destroy
  validates :title, :topic_id, :presence => true
  validates :title, :uniqueness => true



end
