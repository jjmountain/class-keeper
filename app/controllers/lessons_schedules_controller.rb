class LessonsSchedulesController < ApplicationController
  
  def create
    skip_authorization
    @lessons_schedule = LessonsSchedule.new(lessons_schedule_params)
    @lessons_schedule.course_id = params[:course_id]
    @course = Course.find(params[:course_id])
    if @lessons_schedule.save 
       @dates_array = CalculateSchedule.call(@lessons_schedule)
    end
  end

  private

  def lessons_schedule_params
    params.require(:lessons_schedule).permit(:start_date, :end_date, :course_id)
  end
end
