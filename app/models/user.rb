class User < ActiveRecord::Base
  has_and_belongs_to_many :roles
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :role_ids, :name, :title, :avatar
  mount_uploader :avatar, AvatarUploader

  # attr_accessible :title, :body
  has_many :comments, :dependent => :destroy
  has_many :discussions, :dependent => :destroy
  
  
  
  def role?(role)
    roles.map(&:name).include? role.to_s
  end
  
end
