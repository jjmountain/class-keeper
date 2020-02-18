class LessonsController < ApplicationController

  def preview
  end
  
  def index
  end

  def show
  end

  def new
    @course = Course.find(params[:course_id])
    @course_period = CoursePeriod.new
    @course_periods = CoursePeriod.where(course_id: @course.id)
    @school = @course.school
    @lesson = Lesson.new
    @period = Period.new
  end

  def create
  end

  def destroy
  end
end
