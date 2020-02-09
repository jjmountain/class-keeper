class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # before_action :authenticate_user!

  devise_group :member, contains: [:user, :student]


  # authenticate for either a user or a student
  before_action :authenticate!

  def authenticate!
    :authenticate_user! || :authenticate_student!
  end

end
