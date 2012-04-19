class Ability
  include CanCan::Ability

  def initialize(user)
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
    user ||= User.new # guest user (not logged in)
    
    user.roles.each do |role| 
      unless role.name == "Super User" 
        if role.permissions
          role.permissions.each do |permission|
		    if permission.subject_id.nil?
		      can permission.action.to_sym, permission.subject_class.constantize
			else
			  can permission.action.to_sym, permission.subject_class.constantize, :id => permission.subject_id
			end
		  end
		end
		if role.name == "Admin"
		  can :see_timestamps, User
        else
	      can :manage, User, :id => user.id
          can :see_timestamps, User, :id => user.id
		end
      end
	  if role.name == "Super User"
		can :manage, :all
	  end
	end      
	
  end
  
end
