class LessonPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def show?
    if user.class == Student
      user.enrollments.pluck(:course_id).include?(record.course.id)
    else
      record.course.user == user
    end
  end

  def setup?
    false if user.class == Student
    record.course.user == user if user.class == User
  end

  def new?
    @user.class == User
  end
  def create? ; new? ; end
  def edit? ; user_is_owner_of_record? ; end
  def update? ; user_is_owner_of_record? ; end

end
