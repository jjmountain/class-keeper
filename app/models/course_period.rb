class CoursePeriod < ApplicationRecord
  belongs_to :course
  belongs_to :period
  enum day: ['monday', 'tuesday', 'wednesday', 'thursday', 'friday', 'saturday', 'sunday']
  validates :day, presence: true

  
end
