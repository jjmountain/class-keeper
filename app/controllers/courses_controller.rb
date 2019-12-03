class CoursesController < ApplicationController

  def index
    @courses = Course.where(user: current_user)
  end

  def show
    @course = Course.find(params[:id])
  end

  def create
  end
  
end
