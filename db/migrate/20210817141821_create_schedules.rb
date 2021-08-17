class CreateSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :schedules do |t|
      t.string :subject
      t.string :start_time
      t.string :end_time

      t.timestamps
    end
  end
end
