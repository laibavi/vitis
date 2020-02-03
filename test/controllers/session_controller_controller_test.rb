require 'test_helper'

class SessionControllerControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get session_controller_new_url
    assert_response :success
  end

end
