class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
      # scope.where(user: user)
    end
  end

  # def new?
  #   true
  # end

  def create?
    true
  end

  def show?
    true
  end

  # def edit?
  #   # If the user is the owner => true
  #   # Else => false
  #   # Pundit    ActRec
  #   # user == current_user
  #   # record == object passed to the authorize method (@restaurant)
  #   record.user == user
  # end

  def update?
    # If the user is the owner => true
    # Else => false
    # Pundit    ActRec
    # user == current_user
    # record == object passed to the authorize method (@restaurant)
    user_is_owner_or_admin?
  end

  def destroy?
    user_is_owner_or_admin?
  end

  private

  def user_is_owner_or_admin?
    record.user == user || user.admin
  end
end
