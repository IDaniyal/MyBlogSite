require 'test_helper'

class UploadControllerTest < ActionDispatch::IntegrationTest
  test "should get destroy" do
    get upload_destroy_url
    assert_response :success
  end

end
