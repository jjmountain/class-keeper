class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :login, :signup]

  def home
  end

  def login
  end

  def signup
  end
end
