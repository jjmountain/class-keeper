class School < ApplicationRecord
  has_many :periods, dependent: :destroy
  has_many :courses
  has_many :faculties
  has_many :semesters
  validates :name, presence: true
  accepts_nested_attributes_for :faculties, allow_destroy: true, reject_if: proc { |attr| attr['name'].blank? }

  def self.select_value
    School.all.map { |school| [school.name, school.id, { data: { url: data_url(school) }}] }
  end

  private

  def self.data_url(school)
    Rails.application.routes.url_helpers.school_faculties_path(school, format: :json)
  end
end
