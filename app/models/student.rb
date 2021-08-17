require 'csv'
class Student < ApplicationRecord
  has_many :student_schedules, dependent: :destroy
  has_many :schedules, through: :student_schedules
  accepts_nested_attributes_for :student_schedules, allow_destroy: true

  validates :first_name, :last_name, presence: true

  def first_and_last_name
    "#{first_name} #{last_name}"
  end

  def self.to_csv
      attributes = %w{first_name last_name}

      CSV.generate(headers: true) do |csv|
          csv << attributes

          all.each do |student|
              csv << student.attributes.values_at(*attributes)
          end
      end
    end
end
