require 'test_helper'

class Members::DestinationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get members_destinations_index_url
    assert_response :success
  end

  test "should get edit" do
    get members_destinations_edit_url
    assert_response :success
  end

end
