require 'test_helper'

class FloorsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get floors_create_url
    assert_response :success
  end

end
