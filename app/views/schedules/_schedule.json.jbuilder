json.extract! schedule, :id, :student_id, :start_time, :end_time, :created_at, :updated_at
json.url subject_url(schedule, format: :json)
