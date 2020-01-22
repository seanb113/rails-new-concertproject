require 'test_helper'

class UpcomingConcertsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get upcoming_concerts_create_url
    assert_response :success
  end

  test "should get destroy" do
    get upcoming_concerts_destroy_url
    assert_response :success
  end

end
