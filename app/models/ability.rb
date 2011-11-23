class Ability
  include CanCan::Ability

  def initialize(admin_user)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user permission to do.
    # If you pass :manage it will apply to every action. Other common actions here are
    # :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. If you pass
    # :all it will apply to every resource. Otherwise pass a Ruby class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details: https://github.com/ryanb/cancan/wiki/Defining-Abilities

    admin_user ||= AdminUser.new
    
    if admin_user.has_role? :admin
      can :manage, :all
    end

    unless admin_user.partner.nil?
       cannot? :manage, Partner
       cannot? :manage, Content
       cannot? :manage, Tag
       cannot? :manage, User
       cannot? :manage, Role
    end

    if admin_user.has_role? :feats
      can :manage, Feat
    end
    if admin_user.has_role? :challenges
      can :manage, Challenge
    end
    if admin_user.has_role? :rewards
      can :manage, Reward
    end
  end
end