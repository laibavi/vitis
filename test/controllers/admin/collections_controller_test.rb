require 'test_helper'

class Admin::CollectionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_collections_index_url
    assert_response :success
  end

end
