# == Schema Information
#
# Table name: comments
#
#  id             :integer          not null, primary key
#  text           :text
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  ancestry       :string(255)
#  imageable_id   :integer
#  imageable_type :string(255)
#  user_id        :integer
#

class Comment < ActiveRecord::Base
  attr_accessible :text, :parent_id, :user_id
  belongs_to :imageable, :polymorphic => true
  belongs_to :user
  has_ancestry
  has_reputation :votes, source: :user, aggregated_by: :sum

  validates :text, :user_id, :imageable_id, :presence => true


end
