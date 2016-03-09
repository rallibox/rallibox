# require 'invitational/cancan' ## use in future

class Ability
  include CanCan::Ability
  # include Invitational::CanCan::Ability   # use in next version

  attr_reader :role_mappings, :user

  # def initialize(user)
  #
  #   @role_mappings = {}
  #   @user = user
  #
  #   # Example:
  #   # can :manage, Entity, roles: [:admin]
  #
  # end

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    # user ||= User.new # guest user (not logged in)
    if user && user.is_admin?
      can :access, :rails_admin # needed to access RailsAdmin
      can :dashboard              # grant access to the dashboard
      can :manage, :all
    end

    if user && user.is_sales_rep?
      can :access, :rails_admin # needed to access RailsAdmin
      can :dashboard              # grant access to the dashboard
      # can :read, [Calendar, User]
      # can :manage, [Account, Address, Note, Service, Consultation]
      can :read, :all
      can :manage, Product#, :hidden => false  # allow sales to only update visible products
      # can :update, Product, :hidden => false  # allow sales to only update visible products

      # can :create, Account
      # can :update, Account do |account|
      #   account.try(:user) == user.is_sales_rep?
      # end
    end
  end
end
