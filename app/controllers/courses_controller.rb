class CoursesController < ApplicationController
  before_action :set_course, only: [:show]

  def index
    @courses = Course.where(user: current_user)
  end

  def show
  end

  def new
    @course = Course.new
    @semesters = Semester.all
  end

  def create
    @course = Course.new(course_params)

  end
  
  private

  def set_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:school, :faculty, :name, :description, :start_date, :end_date, :class_type, :class_number, :lessons_per_week, :weeks_per_course)
  end
end
