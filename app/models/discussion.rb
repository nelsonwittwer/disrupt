# == Schema Information
#
# Table name: discussions
#
#  id             :integer          not null, primary key
#  title          :string(255)
#  imageable_id   :integer
#  imageable_type :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  topic_id       :integer
#  user_id        :integer
#

class Discussion < ActiveRecord::Base
  attr_accessible :title, :topic_id, :user_id
  belongs_to :imageable, :polymorphic => true
  belongs_to :topic
  belongs_to :user
  has_many :comments, :as => :imageable, :dependent => :destroy
  validates :title, :topic_id, :presence => true
  validates :title, :uniqueness => true
  validates :user_id, :presence => true

  has_reputation :votes, source: :user, aggregated_by: :sum
  
  def get_startup
    @startup = Startup.find(self.imageable_id)
  end
end
