class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :student_number, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :gender, 
            inclusion: { in: %w(male female non-binary), 
            message: "%{value} is not a valid gender"}
  has_many :attendances
  has_many :enrollments

  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
