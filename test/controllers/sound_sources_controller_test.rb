require 'test_helper'

class SoundSourcesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get sound_sources_create_url
    assert_response :success
  end

  test "should get destroy" do
    get sound_sources_destroy_url
    assert_response :success
  end

end
