class LessonsController < ApplicationController

  def preview
  end
  
  def index
  end

  def show
  end

  def new
    @course = Course.find(params[:course_id])
    @faculty = @course.faculty
    @course_period = CoursePeriod.new
    @course_periods = CoursePeriod.where(course_id: @course.id)
    @lessons_schedule = LessonsSchedule.find_by(course_id: params[:course_id])
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
end
