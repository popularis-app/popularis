require 'test_helper'

class FeedbacksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get feedbacks_index_url
    assert_response :success
  end

  test "should get new" do
    get feedbacks_new_url
    assert_response :success
  end

  test "should get create" do
    get feedbacks_create_url
    assert_response :success
  end

end
