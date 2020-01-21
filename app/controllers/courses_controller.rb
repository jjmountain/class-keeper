class CoursesController < ApplicationController
  before_action :set_course, only: [:show]

  def index
    @courses = Course.where(user: current_user)
  end

  def show
  end

  def new
    @course = Course.new
  end

  def create
  end
  
  private

  def set_course
    @course = Course.find(params[:id])
  end
end
