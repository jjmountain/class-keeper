class School < ApplicationRecord
  has_many :campus
  has_many :periods
  has_many :courses
end
