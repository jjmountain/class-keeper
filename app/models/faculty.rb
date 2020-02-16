class Faculty < ApplicationRecord
  belongs_to :school, optional: true
  has_many :courses
  validates :name, uniqueness: { scope: :school_id, message: 'That faculty already exists at this school' }
  accepts_nested_attributes_for :courses

  def self.select_values(school)
    return [] unless school
    school.faculties.pluck(:name, :id)
  end
end
