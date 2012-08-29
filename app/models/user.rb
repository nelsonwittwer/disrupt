# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  name                   :string(255)
#  title                  :string(255)
#  pic_file_name          :string(255)
#

class User < ActiveRecord::Base
  validates :name, :email, :encrypted_password, :presence => true

  belongs_to :role

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :role_ids, :name, :title, :avatar
  
  has_many :comments, :dependent => :destroy
  has_many :discussions, :dependent => :destroy

  has_reputation :votes, source: {reputation: :votes, of: :discussions}, aggregated_by: :sum
  has_many :evaluations, class_name: "RSEvaluation", as: :source

  has_attached_file :avatar#,
  #    :styles => { :full => "80x80#", :thumb => "40x40#" },
  #  :storage => :s3,
  # :s3_credentials => {
  #   :access_key_id => ENV['S3_KEY'],
  #   :secret_access_key => ENV['S3_SECRET']
  # },
  # :bucket => ENV['S3_BUCKET'],
  # :path => ":attachment/:id"

  validates_attachment :avatar, 
  :content_type => { :content_type => ['image/jpeg', 'image/jpg', 'image/png'] },
  :size => { :in => 0..100.kilobytes }

  def voted_for?(d)
  	evaluations.where(target_type: d.class, target_id: d.id).present?
  end
  
  
 

  
end
