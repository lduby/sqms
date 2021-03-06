class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.has_role? :superuser
      can :manage, :all
    else 
      # Getting all permissions from the database
      user.roles.each do |role| 
        if role.permissions
          role.permissions.each do |permission|
		    if permission.subject_id.nil?
		      can permission.action.to_sym, permission.subject_class.constantize
		    else
			  can permission.action.to_sym, permission.subject_class.constantize, :id => permission.subject_id
		    end
		  end
	    end
	  end 
	end
	# Additional permissions
	if user.has_role? :admin
	  can :see_timestamps, User
    else
	  can :manage, User, :id => user.id
      can :see_timestamps, User, :id => user.id
	end
    
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
  end
end
