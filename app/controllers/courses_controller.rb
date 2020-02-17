class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update]

  def index
    @courses = Course.where(user: current_user)
  end

  def show
    @enrollments = Enrollment.where(course_id: params[:id])
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    @course.user = current_user 

    # if using selects then they will be created through nested attributes - no need to be concerned except update faculty school_id manually

    # if user entered the school and faculty, grab it from params and add it manually to course
    # if params[:course][:school] && params[:course][:faculty]
    #   raise
    #   @course.school_id = params[:course][:school]
    #   @course.faculty_id = params[:course][:faculty]

    # # if user only entered faculty, grab it from params and add it manually to course
    # elsif params[:course][:faculty]
    #   @course.faculty_id = params[:course][:faculty]
    #   raise
    # end

    if @course.save
      # set the faculty school id because form doesn't update it
      @course.faculty.school_id = @course.school_id
      @course.faculty.save
      redirect_to course_path(@course)
    else
      render 'new'
    end
  end

  def edit
   @course = Course.find(params[:id])
  end

  def update
    @course = Course.find(params[:id])
    @course.update(
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
      redirect_to course_path(@course), notice: 'Course successfully updated!'
    else
      render 'edit'
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
    params.require(:course).permit(:school_id, :faculty_id, :name, :description, :start_date, :end_date, :class_type, :class_number, :lessons_per_week, :weeks_per_course, faculty_attributes: [:id, :name, :max_absences, :school_id], school_attributes: [:id, :name] )
  end
end
