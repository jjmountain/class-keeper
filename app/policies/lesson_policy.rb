class LessonPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    user == record.course.user
  end
  
  def new?
    @user.class == User
  end
  def create? ; new? ; end
  def edit? ; user_is_owner_of_record? ; end
  def update? ; user_is_owner_of_record? ; end


end
