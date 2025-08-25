# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    # admin =============================================
    can :manage, :all if user.admin == true
    # admin =============================================

    # manager ===========================================
    if user.manager == true
      # Can manage all owned records on Reimbursement model
      can :create, Reimbursement
      can :update, Reimbursement do |reimbursement|
        reimbursement.user_id == user.id
      end
      can :destroy, Reimbursement do |reimbursement|
        reimbursement.user_id == user.id
      end
      can :read, Reimbursement do |reimbursement|
        reimbursement.user_id == user.id
      end
      can :print, Reimbursement do |reimbursement|
        reimbursement.user_id == user.id
      end
      can :print_list, Reimbursement do |reimbursement|
        reimbursement.user_id == user.id
      end
    end
    # Can manage all owned records on ReimbursementClosure model
    can :create, ReimbursementClosure
    can :update, ReimbursementClosure do |reimbursement_closure|
      reimbursement_closure.user_id == user.id if reimbursement_closure.payment != true
    end
    can :destroy, ReimbursementClosure do |reimbursement_closure|
      reimbursement_closure.user_id == user.id if reimbursement_closure.payment != true
    end
    can :read, ReimbursementClosure do |reimbursement_closure|
      reimbursement_closure.user_id == user.id
    end
    # manager ===========================================

    # payroll ===========================================
    if user.payroll == true
      # Can manage all owned records on Reimbursement model
      can :create, Reimbursement
      can :update, Reimbursement do |reimbursement|
        reimbursement.user_id == user.id
      end
      can :destroy, Reimbursement do |reimbursement|
        reimbursement.user_id == user.id
      end
      can :read, Reimbursement do |reimbursement|
        reimbursement.user_id == user.id
      end
      can :print, Reimbursement do |reimbursement|
        reimbursement.user_id == user.id
      end
      can :print_list, Reimbursement do |reimbursement|
        reimbursement.user_id == user.id
      end
      # Can manage all owned records on ReimbursementClosure model
      can :create, ReimbursementClosure
      can :update, ReimbursementClosure do |reimbursement_closure|
        reimbursement_closure.user_id == user.id || reimbursement_closure.user.province == user.province && reimbursement_closure.user.region == user.region if reimbursement_closure.payment != true
      end
      can :destroy, ReimbursementClosure do |reimbursement_closure|
        reimbursement_closure.user_id == user.id if reimbursement_closure.payment != true
      end
      can :read, ReimbursementClosure do |reimbursement_closure|
        reimbursement_closure.user_id == user.id || reimbursement_closure.user.province == user.province && reimbursement_closure.user.region == user.region
      end
    end
    # payroll ===========================================

    # regular ===========================================
    if user.regular == true
      # Can manage all owned records on Reimbursement model
      can :create, Reimbursement
      can :update, Reimbursement do |reimbursement|
        reimbursement.user_id == user.id
      end
      can :destroy, Reimbursement do |reimbursement|
        reimbursement.user_id == user.id
      end
      can :read, Reimbursement do |reimbursement|
        reimbursement.user_id == user.id
      end
      can :print, Reimbursement do |reimbursement|
        reimbursement.user_id == user.id
      end
      can :print_list, Reimbursement do |reimbursement|
        reimbursement.user_id == user.id
      end
      # Can manage all owned records on ReimbursementClosure model
      can :create, ReimbursementClosure
      can :update, ReimbursementClosure do |reimbursement_closure|
        reimbursement_closure.user_id == user.id if reimbursement_closure.payment != true
      end
      can :destroy, ReimbursementClosure do |reimbursement_closure|
        reimbursement_closure.user_id == user.id if reimbursement_closure.payment != true
      end
      can :read, ReimbursementClosure do |reimbursement_closure|
        reimbursement_closure.user_id == user.id
      end
    end
    # regular ===========================================
  end
end
