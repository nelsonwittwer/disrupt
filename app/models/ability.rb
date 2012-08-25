class Ability
  include CanCan::Ability
  
  def initialize(user)
    if user==nil
      user ||= User.new # guest user
      user.role_id=4
    end
    
    if user.role_id == 1
      can :manage, :all
      cannot :vote, [Discussion, Comment], :user_id => user.id     
    elsif user.role_id == 2
      can :manage, [Startup, Discussion, Comment] 
      can :vote, [Discussion, Comment]
      cannot :vote, [Discussion, Comment], :user_id => user.id     
    elsif user.role_id == 3
      can :read, :all
      can :create, [Discussion, Comment]
      can :manage, [Discussion] do |discussion|
        discussion.try(:user) == user
      end
      can :vote, [Discussion, Comment]
      cannot :vote, [Discussion, Comment], :user_id => user.id
      can :manage, [Comment] do |comment|
        comment.try(:user) == user
      end
      can :update, [User] do |u|
        u.try(:id) == user.id
      end
      can :read, :all
    else
      can :read, :all
    end
  end
end