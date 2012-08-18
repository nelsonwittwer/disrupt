class Ability
  include CanCan::Ability
  
  def initialize(user)
    if user==nil
      user ||= user.new # guest user
      user.role_id=4
    end
    
    if user.role_id == 1
      can :manage, :all
    elsif user.role_id == 2
      can :manage, Startup, Discussion, Comment      
    elsif user.role_id == 3
      can :read, :all
      can :create, [Discussion, Comment]
      can :update, [Discussion] do |discussion|
        discussion.try(:user) == user
      end
      can :update, [Comment] do |comment|
        comment.try(:user) == user
      end
      can :update, [User] do |u|
        u.try(:id) == user.id
      end
    else
      can :read, :all
    end
  end
end