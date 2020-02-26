class LessonsSchedulesPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    @user.class == User 
  end

  def create?
    new
  end

end
