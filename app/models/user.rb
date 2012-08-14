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
  has_and_belongs_to_many :roles

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :role_ids, :name, :title, :picture
  # has_one :picture, :dependent => :destroy
  # accepts_nested_attributes_for :picture, :allow_destroy => true
  has_many :comments, :dependent => :destroy
  has_many :discussions, :dependent => :destroy

  
  
  def role?(role)
    roles.map(&:name).include? role.to_s
  end

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || root_path
  end
  
end
