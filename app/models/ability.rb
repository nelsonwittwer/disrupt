class Ability
  include CanCan::Ability
  
  def initialize(user)
    user ||= User.new # guest user
    
    if user.role? :admin
      can :manage, :all
    elsif user.role? :moderator
      can :manage, Startup, Discussion, Comment, Picture      
    elsif user.role? :member
      can :read, :all
      can :create, [Discussion, Comment]
      can [:update, :destroy], [Discussion, Comment], :user_id => user.id
      can [:update, :destroy], User do |u|
        u == user
      end
      
    else
      can :read, :all
    end
  end
end