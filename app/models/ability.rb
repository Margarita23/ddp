# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def init_secretary
    cannot :create, Mark
    can :crud, [DefenseProcess, Group, Student, Diploma, Protocol, Commission]
  end

  def init_commissioner
    can [:create, :edit], Mark
  end

  def initialize(user)
  
      user ||= User.new
      
      alias_action :create, :read, :update, :destroy, to: :crud
      
      if !user.new_record?
        # can :crud, [DefenseProcess, Student, Diploma]
        # can :create_pdf, [Student]
        can :read, :all

        case user.role
          when "secretary"
            init_secretary
          when "commissioner"
            init_commissioner
        end
      
      else
        cannot :crud, [DefenseProcess, Group, Student, Diploma]
      end
    # Define abilities for the user here. For example:
    #
    #   return unless user.present?
    #   can :read, :all
    #   return unless user.admin?
    #   can :manage, :all
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
    #   can :update, Article, published: true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/blob/develop/docs/define_check_abilities.md
  end
end
