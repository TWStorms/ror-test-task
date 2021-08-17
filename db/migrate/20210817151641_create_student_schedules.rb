class CreateStudentSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :student_schedules do |t|
      t.references :student, foreign_key: true, null: false
      t.references :schedule, foreign_key: true, null: false
      t.integer :level, null: true

      t.timestamps
    end
    add_index :student_schedules, [:student_id, :schedule_id], unique: true
  end
end
