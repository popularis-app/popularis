require 'test_helper'

class SentencesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get sentences_index_url
    assert_response :success
  end

  test "should get show" do
    get sentences_show_url
    assert_response :success
  end

end
