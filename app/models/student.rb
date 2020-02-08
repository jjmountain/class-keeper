class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  # mount_uploader :photo, PhotoUploader
  validates :student_number, presence: true
  validates :given_name, presence: true
  validates :family_name, presence: true
  has_many :attendances
  has_many :enrollments, dependent: :destroy

  def full_name
    "#{given_name} #{family_name}"
  end

end
