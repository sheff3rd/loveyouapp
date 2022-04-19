require "test_helper"

class ScenesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get scenes_show_url
    assert_response :success
  end
end
