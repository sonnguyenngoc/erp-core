module Erp
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
      # The first argument to `can` is the action you are giving the user 
      # permission to do.
      # If you pass :manage it will apply to every action. Other common actions
      # here are :read, :create, :update and :destroy.
      #
      # The second argument is the resource the user can perform the action on. 
      # If you pass :all it will apply to every resource. Otherwise pass a Ruby
      # class of the resource.
      #
      # The third argument is an optional hash of conditions to further filter the
      # objects.
      # For example, here the user can only update published articles.
      #
      #   can :update, Article, :published => true
      #
      # See the wiki for details:
      # https://github.com/ryanb/cancan/wiki/Defining-Abilities
      
      Dir.glob(Rails.root.join('engines').to_s + "/*") do |d|
        eg = d.split(/[\/\\]/).last
        method = eg + '_ability'
        send(method, user) if self.respond_to?(method.to_sym)
      end
      
      # Can Erp::User
      can :create, Erp::User if user.get_permission(:user_management, :user, :users, :create) == 'yes'
      can :view_salary, :all if user.get_permission(:user_management, :user, :users, :view_salary) == 'yes'      
      can :edit, Erp::User do |u|
        can = false
        if user.get_permission(:user_management, :user, :users, :edit_mine) == 'yes' and u.id == user.id
          can = true
        end
        if user.get_permission(:user_management, :user, :users, :edit_other_dept) == 'yes' and u.department_id != user.department_id and u.id != user.id
          can = true
        end
        if user.get_permission(:user_management, :user, :users, :edit_own_dept) == 'yes'  and u.department_id == user.department_id and u.id != user.id
          can = true
        end
        
        can
      end
      
      can :delete, Erp::User do |u|
        can = false
        if user.get_permission(:user_management, :user, :users, :delete_mine) == 'yes' and u.id == user.id
          can = true
        end
        if user.get_permission(:user_management, :user, :users, :delete_other_dept) == 'yes' and u.department_id != user.department_id and u.id != user.id
          can = true
        end
        if user.get_permission(:user_management, :user, :users, :delete_own_dept) == 'yes'  and u.department_id == user.department_id and u.id != user.id
          can = true
        end
        
        can
      end
      
      # Can Erp::UserGroup
      can :index, Erp::UserGroup if user.get_permission(:user_management, :user_group, :user_groups, :index) == 'yes'
      can :create, Erp::UserGroup if user.get_permission(:user_management, :user_group, :user_groups, :create) == 'yes'
      can :edit, Erp::UserGroup if user.get_permission(:user_management, :user_group, :user_groups, :edit) == 'yes'
      
      # Can Erp::Department
      can :index, Erp::Department if user.get_permission(:user_management, :department, :departments, :index) == 'yes'
      can :create, Erp::Department if user.get_permission(:user_management, :department, :departments, :create) == 'yes'
      can :edit, Erp::Department if user.get_permission(:user_management, :department, :departments, :edit) == 'yes'
      can :delete, Erp::Department if user.get_permission(:user_management, :department, :departments, :delete) == 'yes'
    end
  end
end
