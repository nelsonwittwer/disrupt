class User < ActiveRecord::Base
  has_and_belongs_to_many :roles

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :role_ids, :name, :title, :picture
  has_one :picture, :dependent => :destroy
  accepts_nested_attributes_for :picture, :allow_destroy => true
  has_many :comments, :dependent => :destroy
  has_many :discussions, :dependent => :destroy

  
  
  def role?(role)
    roles.map(&:name).include? role.to_s
  end
  
end
