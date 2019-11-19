class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :student_number, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  has_many :attendances
  has_many :enrollments
end
