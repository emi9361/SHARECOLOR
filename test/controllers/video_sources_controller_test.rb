require 'test_helper'

class VideoSourcesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get video_sources_create_url
    assert_response :success
  end

  test "should get destroy" do
    get video_sources_destroy_url
    assert_response :success
  end

end
