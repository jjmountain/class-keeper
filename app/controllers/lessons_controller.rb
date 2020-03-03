class LessonsController < ApplicationController
  before_action :set_lesson, only: [ :show ]

  def preview
  end
  
  def index
  end

  def show
    authorize @lesson
  end

  def new
    @course = Course.find(params[:course_id])
    @faculty = @course.faculty
    @course_period = CoursePeriod.new
    @course_periods = CoursePeriod.where(course_id: @course.id)
    @lessons_schedule = LessonsSchedule.new
    @school = @course.school
    @lesson = Lesson.new(course_id: params[:course_id])
    @period = Period.new
    authorize @lesson
  end

  def create
  end

  def destroy
  end

  private
  
  def lesson_params
    params.require(:lesson).permit(:course_id)
  end

  def set_lesson
    @lesson = Lesson.find(params[:id])
  end
end
