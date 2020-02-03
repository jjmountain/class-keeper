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
    course_params
    @course = Course.new(
      name: course_params[:name], 
      description: course_params[:description], 
      start_date: course_params[:start_date], 
      end_date: course_params[:end_date], 
      class_type: course_params[:class_type],
      class_number: course_params[:class_number],
      lessons_per_week: course_params[:lessons_per_week],
      weeks_per_course: course_params[:weeks_per_course]
    )
    @course.user = current_user
    @course.school_id = course_params[:school].to_i
    @course.faculty_id = course_params[:faculty].to_i
    if @course.save
      redirect_to course_path(@course)
    else
      render 'new'
    end
  end

  def destroy
    @course = Course.find(params[:id])
    @course.destroy
    redirect_to courses_path
  end
  
  private

  def set_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:school, :faculty, :name, :description, :start_date, :end_date, :class_type, :class_number, :lessons_per_week, :weeks_per_course)
  end
end
