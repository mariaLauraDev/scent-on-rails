require "test_helper"

class IntervieweesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get interviewees_index_url
    assert_response :success
  end

  test "should get show" do
    get interviewees_show_url
    assert_response :success
  end

  test "should get new" do
    get interviewees_new_url
    assert_response :success
  end

  test "should get create" do
    get interviewees_create_url
    assert_response :success
  end

  test "should get edit" do
    get interviewees_edit_url
    assert_response :success
  end

  test "should get update" do
    get interviewees_update_url
    assert_response :success
  end
end
