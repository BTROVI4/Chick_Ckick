class SpecialistPolicy < ApplicationPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @user = model
  end

  def show?
    @current_user.company_editor? or @current_user == @user
  end

  def create?
    @current_user.company_editor? or @current_user.admin? 
  end

  def edit?
    @current_user.company_editor? or @current_user.admin? or @current_user.user?
  end

  def destroy?
    return false if @current_user == @user
    @current_user.company_editor? or @current_user.admin?
  end
end
