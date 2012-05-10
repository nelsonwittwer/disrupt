class Comment < ActiveRecord::Base
  attr_accessible :body
  
  belongs_to :commentable, :polymorphic => true
  has_many :comments, :as => :commentable
  
  def post
  	return @discussion if defined?(@discussion)
  	@discussion = commentable.is_a?(Discussion) ? commentable : commentable.discussion
  end


end
