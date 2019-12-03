class Period < ApplicationRecord
  belongs_to :school
  has_many :courses
end
