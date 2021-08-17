require 'csv'
class Schedule < ApplicationRecord
  has_many :student_schedules, dependent: :destroy
  has_many :students, through: :student_schedules
  accepts_nested_attributes_for :student_schedules, allow_destroy: true

   def self.to_csv
     attributes = %w{subject start_time end_time}

     CSV.generate(headers: true) do |csv|
         csv << attributes

         all.each do |schedule|
             csv << schedule.attributes.values_at(*attributes)
         end
     end
   end

end
