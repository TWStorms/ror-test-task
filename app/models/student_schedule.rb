class StudentSchedule < ApplicationRecord

  belongs_to :student
  belongs_to :schedule

  validates :student, uniqueness: {scope: :schedule}, if: :_not_marked_for_destruction?

  before_validation :_default_values_on_create, on: :create

  def _default_values_on_create
#     self.level ||= DEFAULT_LEVEL
    # return value should be true or nil
    true
  end

  def _not_marked_for_destruction?
    # Rails validation does not work well when we update subject with
    # teacher_subjects_attributes when we mark_for_destruction
    schedule.student_schedules.none?(&:_destroy)
  end
end
