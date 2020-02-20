require 'pry'
class PeriodsController < ApplicationController
  def create
    @course = Course.find(params[:period][:course])
    @school = School.find(params[:school_id])
    @period = Period.new(period_params)
    @period.faculty = @course.faculty
    if @period.save
      # @course_period = CoursePeriod.create(course_id: @course.id, period_id: @period.id)
      respond_to do |format|
          format.js
        end
    end
  end

  private

  def period_params
    params.require(:period).permit(:period_number, :start_time, :minutes)
  end
end
