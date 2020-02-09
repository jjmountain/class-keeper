class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  # mount_uploader :photo, PhotoUploader
  has_one_attached :photo
  validates :student_number, presence: true
  validates :given_name, presence: true
  validates :family_name, presence: true
  has_many :attendances
  has_many :enrollments, dependent: :destroy
  has_many :courses, through: :enrollments

  def full_name
    "#{given_name} #{family_name}"
  end

  def full_name_kanji
    "#{family_name_kanji} #{given_name_kanji}"

  end

  def schools
    enrollments.map { |enrollment| enrollment.course.school } 
  end

  # def courses
  #   enrollments.map { |enrollment| enrollment.course.school } 
  # end

end
