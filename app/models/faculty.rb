class Faculty < ApplicationRecord
  belongs_to :school
  has_many :courses

  def self.select_values(school)
    return [] unless school
    school.faculties.pluck(:name, :id)
  end
end
