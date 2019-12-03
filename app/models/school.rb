class School < ApplicationRecord
  has_many :periods, dependent: :destroy
  has_many :courses
end
