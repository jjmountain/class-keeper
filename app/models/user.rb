class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  mount_uploader :photo, PhotoUploader
  has_many :courses, dependent: :destroy
  validates :first_name, presence: true
  validates :last_name, presence: true
  
  # return the school objects for the teacher
  def schools
    School.joins(periods: [:courses]).where(courses: {user_id: self.id}).uniq
  end
  
  # return the course objects for a given school
  def courses_for_school(school)
    Course.joins(period: [:school]).where()
  end
end
