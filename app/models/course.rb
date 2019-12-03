class Course < ApplicationRecord
  belongs_to :user
  belongs_to :period
  belongs_to :school
  has_many :scheduled_lessons, dependent: :destroy
  validates :name, presence: true

  def school
    self.period.school
  end

end
