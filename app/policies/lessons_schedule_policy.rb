class LessonsSchedulePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    true
  end

  def create?
    new?
  end

  def destroy?
    record.course.user == user
  end

end
