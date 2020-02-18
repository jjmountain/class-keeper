require 'pry'
class PeriodsController < ApplicationController
  def create
    @school = School.find(params[:school_id])
    @period = Period.new(period_params)
    @period.school = @school
    if @period.save
      @course_period = CoursePeriod.create(course_id: params[:period][:course], period_id: @period.id)
      binding.pry
      respond_to do |format|
          format.js
        end
    end
  end

  private

  def period_params
    params.require(:period).permit(:period_number, :start_time, :end_time)
  end
end
