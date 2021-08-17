class GamePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where.not(user: user).order(created_at: :desc)
    end
  end

  def show?
    true
  end

  def create?
    return true
  end

  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end

end
