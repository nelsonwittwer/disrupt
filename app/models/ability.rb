class Ability
  include CanCan::Ability
  
  def initialize(user)
    user ||= User.new # guest user
    
    if user.role_id == 1
      can :manage, :all
    elsif user.role_id == 2
      can :manage, Startup, Discussion, Comment, Picture      
    elsif user.role_id == 3
      can :read, :all
      can :create, [Discussion, Comment]
      can [:update, :destroy], [Discussion, Comment], :active => true, :user_id => user.id
      can [:manage], User, :active => true, :user_id => user.id
    else
      can :read, :all
    end
  end
end