class Ability
  include CanCan::Ability
  
  def initialize(user)
    user ||= User.new # guest user
    
    if user.role? :admin
      can :manage, :all
    elsif user.role? :moderator
      can :manage, Startup, Discussion, Comment      
    elsif user.role? :member
      can :read, :all
      can :create, Comment
      can :update, Comment do |comment|
        comment.try(:user) == user || user.role?(:moderator)
      end
      can :create, Discussion
      can :update, Discussion do |discussion|
        discussion.try(:user) == user || user.role?(:moderator)
      end
    else
      can :read, :all
    end
  end
end