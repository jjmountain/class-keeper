class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  mount_uploader :photo, PhotoUploader
  validates :student_number, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :gender, 
            inclusion: { in: %w(male female non-binary), 
            message: "%{value} is not a valid gender"}
  has_many :attendances
  has_many :enrollments

  def self.full_name
    "#{first_name} #{last_name}"
  end

  def self.photo_blank?
    photo.blank?
  end

end
