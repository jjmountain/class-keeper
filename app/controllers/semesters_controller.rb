class SemestersController < ApplicationController

  def new

  end

  def create
  end

  private

  def semester_params
    params.require(:semester).permit(:name, :start_date, :name, :description)
  end
  
end
