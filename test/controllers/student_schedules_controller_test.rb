require 'test_helper'

class StudentSchedulesControllerTest < ActionDispatch::IntegrationTest
  test "should get student_subjectsindex" do
    get student_schedules_student_subjectsindex_url
    assert_response :success
  end

end
