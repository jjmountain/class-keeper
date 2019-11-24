class CoursesController < ApplicationController

  def index
    @courses = Course.where(user_id: current_user.id)
  end

  def create
  end
  
end
