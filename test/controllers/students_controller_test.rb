require 'test_helper'

class StudentsControllerTest < ActionDispatch::IntegrationTest
  test "should get studentsindex" do
    get students_studentsindex_url
    assert_response :success
  end

end
