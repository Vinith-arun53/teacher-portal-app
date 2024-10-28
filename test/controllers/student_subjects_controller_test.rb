require "test_helper"

class StudentSubjectsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get student_subjects_index_url
    assert_response :success
  end
end
