class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # mount_uploader :photo, PhotoUploader
  has_one_attached :photo
  has_many :courses, dependent: :destroy
  validates :first_name, presence: true
  validates :last_name, presence: true

  
  # return the school objects for the teacher
  def schools
    School.joins(:courses).where(courses: {user_id: self.id}).uniq
  end
  
  # return the course objects for a given school
  def courses_for_school(school_id)
    Course.joins(period: [:school]).where(user_id: self.id).where()
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
