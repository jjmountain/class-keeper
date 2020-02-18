class CoursePeriodsController < ApplicationController
  def create
    @course_period = CoursePeriod.new(
      day: course_period_params[:day].to_i,
      course_id: course_period_params[:course_id],
      period_id: course_period_params[:period_id]
    )
    if @course_period.save!
      # binding.pry
      respond_to do |format|
        format.js
      end
    end
  end

  private

  def course_period_params
    params.require(:course_period).permit(:day, :period_id, :course_id)
  end
end
