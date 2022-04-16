require "test_helper"

class PushControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get push_create_url
    assert_response :success
  end
end
